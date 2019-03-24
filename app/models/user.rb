class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards
  has_many :links
  has_many :collaborations
  has_many :shared_boards, through: :collaborations, source: :board

  validates :nickname, presence: true
  validates :nickname, uniqueness: true

  mount_uploader :avatar, AvatarUploader
end
