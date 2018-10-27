class Api::V1::SlackInteractionsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :verify_slack_request

  # def create
  #   # create action for creating idea object with Slack action
  # end

    def create

    Idea.create!(content: params[:text], category: "peace", user: User.find(3))
    json = {
    "text": "You just logeed a great ideas!",
    "attachments": [
        {
            "text": "Do you like this idea?",
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
    # create action for endorsing an idea
  end
end

  private

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
