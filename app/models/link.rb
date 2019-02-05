class Link < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :url, :format => URI::regexp(%w(http https))
  # validates :title, presence: true
  # validates :image, presence: true
  validates :board_id, presence: true
  # mount_uploader :image, ImageUploader

  default_scope { order(created_at: :desc) }
end
