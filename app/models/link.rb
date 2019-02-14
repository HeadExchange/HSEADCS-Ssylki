class Link < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :url, :format => URI::regexp(%w(http https))
  validates :board_id, presence: true

  default_scope { order(created_at: :desc) }

  before_save :fetch_metadata

  def fetch_metadata
    metadata = LinkThumbnailer.generate(url)
    self.title = metadata.title
    self.image = metadata.images.first.src.to_s
  end
end
