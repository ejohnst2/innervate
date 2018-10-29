module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def slack
      # handle callback for slack
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
    end
  end
end
