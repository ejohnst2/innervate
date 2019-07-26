class Idea < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { minimum: 50 }
  validates :user, presence: true
  validates :category, presence: true
  validates :stage, presence: true
  validates :channel, presence: true
end
