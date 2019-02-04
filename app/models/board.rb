class Board < ApplicationRecord
  has_many :links
  belongs_to :user

  validates :title, presence: true
  
  scope :ordered_by_title, -> { reorder(title: :asc) }

end
