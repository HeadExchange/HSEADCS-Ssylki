class Link < ApplicationRecord
  belongs_to :board
  belongs_to :user

  mount_uploader :image, ImageUploader
end
