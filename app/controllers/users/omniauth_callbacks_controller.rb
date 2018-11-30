module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def slack
      # handle callback for slack
      verify_slack_team
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
    end

    private

    def verify_slack_team
      Team.from_omniauth(request.env["omniauth.auth"])
    end
  end
end
