class User < ApplicationRecord
  has_many :ideas
  belongs_to :team
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:slack]

  def self.from_omniauth(auth)
    # checks for user, if it returns nill, then it creates a user
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # puts JSON.pretty_generate(auth)
      user.uid = auth.uid
      user.team = Team.find_by(slack_id: auth.extra.raw_info.team_id)
      user.username = auth.info.user
      user.firstname = auth.info.first_name
      user.lastname = auth.info.last_name
      auth.info.email.blank? ? user.email =  "nil@nil.com" : user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.save
      puts user.errors.full_messages
    end
  end
end
