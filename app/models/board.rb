class Board < ApplicationRecord
  has_many :links
  # belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
end
