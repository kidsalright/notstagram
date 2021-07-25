class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  has_one_attached :avatar

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def display_avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      'default.png'
    end
  end

end
