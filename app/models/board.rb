class Board < ApplicationRecord
  has_many :links
  belongs_to :user
end
