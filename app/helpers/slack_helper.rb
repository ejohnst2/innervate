module SlackHelper
  def sign_in_with_slack_button
    slack_login_url = "https://50c32971.ngrok.io/users/auth/slack/callback"
    %Q(<a href="https://slack.com/oauth/authorize?redirect_uri=#{slack_login_url}&scope=identity.basic,identity.email,identity.team,identity.avatar&client_id=#{ENV['SLACK_CLIENT_ID']}"><img alt="Sign in with Slack" height="40" width="172" src="https://platform.slack-edge.com/img/sign_in_with_slack.png" srcset="https://platform.slack-edge.com/img/sign_in_with_slack.png 1x, https://platform.slack-edge.com/img/sign_in_with_slack@2x.png 2x" /></a>).html_safe
  end

  def add_to_slack
    add_to_slack_url = '<a href="https://slack.com/oauth/authorize?scope=incoming-webhook,commands,bot&client_id=346952315347.428070190821"><img alt="Add to Slack" height="40" width="139" src="https://platform.slack-edge.com/img/add_to_slack.png" srcset="https://platform.slack-edge.com/img/add_to_slack.png 1x, https://platform.slack-edge.com/img/add_to_slack@2x.png 2x" /></a>'
  end
end
