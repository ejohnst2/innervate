class Team < ApplicationRecord
  has_many :users

  validates :plan, presence: true
  validates :name, presence: true
  validates :slack_id, presence: true

  def self.from_omniauth(auth)
    unless Team.where(slack_id: auth.extra.raw_info.team_id).exists?
      Team.create(
        name: auth.extra.raw_info.team,
        slack_id: auth.extra.raw_info.team_id,
        plan: "free"
      )
    end
  end
end
