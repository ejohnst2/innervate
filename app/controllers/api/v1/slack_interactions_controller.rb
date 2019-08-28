class Api::V1::SlackInteractionsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :verify_slack_request, :check_user_exists

  #  create action for creating idea object with Slack action
  def create
    category = params[:text].scan(/#(\w+)/).flatten

    idea = Idea.create!(
      content: params[:text],
      category: category,
      user: User.find_by(uid: params[:user_id]),
      channel: params[:channel_name],
      stage: "seed"
      )
    json = {
      "text": "#{idea.content}",
      "attachments": [
        {
          "text": "#{idea.user.firstname} just logged a new idea!",
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

  # check if the user exists
  def check_user_exists
    not_a_user = { "text": "You ain't a user - please sign up with this link: ENV['BASE_URL']/users/sign_up" }
    unless User.exists?(username: params[:user_name])
      puts params[:user_name]
      render json: not_a_user
    end
  end

  def heat_check
    # checks how many endorsements an idea has, if enough to be fire - start a new slack channel
    # client = Slack::Web::Client.new(token: 'your_token')
    # client.channels_create(name: "my_channel_name")
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
