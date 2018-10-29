class Team < ApplicationRecord
  has_many :users

  def self.from_omniauth(auth)
    # make method for Team to create on Add to Slack initial install
  end

end
