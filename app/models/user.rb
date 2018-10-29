class User < ApplicationRecord
  has_many :ideas
  belongs_to :team
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:slack]

  def self.from_omniauth(auth)
    # User.create!(
    #   username: auth.info.user_id,
    #   uid: auth.uid,
    #   team: Team.find(3),
    #   email: "rayray@ray.com",
    #   password: Devise.friendly_token[0,20]
    # )

    # checks for user, if it returns nill, then it creates a user
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      puts auth
      user.uid = auth.uid
      user.team = Team.find_by(3)
      user.username = auth.info.user_id
      user.email = "ray@ray.com"
      user.password = Devise.friendly_token[0,20]
    end
  end
end
