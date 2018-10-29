class Api::V1::SlackInteractionsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :verify_slack_request, :check_user_exists

  #  create action for creating idea object with Slack action
  def create

  # use regex to get hashtags as category

    idea = Idea.create!(
      content: params[:text],
      category: "peace",
      user: User.find(3),
      channel: params[:channel_name]
      )
    json = {
      "text": "#{idea.content}",
      "attachments": [
        {
          "text": "#{idea.user.email} just logged a new idea",
          "fallback": "You are unable to choose a game",
          "callback_id": "wopr_game",
          "color": "#3AA3E3",
          "attachment_type": "default",
          "actions": [
            {
              "name": "game",
              "text": "endorse",
              "type": "button",
              "value": "chess"
            },
            {
              "name": "game",
              "text": "Suggest",
              "type": "button",
              "value": "maze"
            },
          ]
        }
      ]
    }

    render json: json
  end

  def endorse
    # need slack action
    # to endorse an idea via Slack
  end

private

  def check_user_exists
    not_a_user = { "text": "You ain't a user - please sign up" }

    unless User.exists?(username: params[:user_name])
      render json: not_a_user
    end
    # check if the user exists
    # if the user does not exist, send them a url to sign up
    # if the user does exist, then continue to add the idea
  end

  #  to verify the request
  def verify_slack_request
    timestamp = request.headers['X-Slack-Request-Timestamp']
    if (Time.now.to_i - timestamp.to_i).abs > 60 * 5
      head :unauthorized
      return
    end

    sig_basestring  = "v0:#{timestamp}:#{request.raw_post}"
    signature       = "v0=" + OpenSSL::HMAC.hexdigest("SHA256", ENV['SLACK_SIGNING_SECRET'], sig_basestring)
    slack_signature = request.headers['X-Slack-Signature']

    if !ActiveSupport::SecurityUtils.secure_compare(signature, slack_signature)
      head :unauthorized
    end
  end
end
