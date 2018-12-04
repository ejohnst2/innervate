class Idea < ApplicationRecord
  belongs_to :user
  # belongs_to :team, through: :user
end
