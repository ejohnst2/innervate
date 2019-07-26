class Idea < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { minimum: 50 }
  validates :user, presence: true
  validates :content, presence: true, length: { minimum: 50 }
end
