class Link < ApplicationRecord

  include PgSearch
  multisearchable against: [:title, :description]

  after_save :reindex

  belongs_to :board
  belongs_to :user

  acts_as_list scope: :board

  validates :url, :format => URI::regexp(%w(http https))
  validates :board_id, presence: true

  mount_uploader :image, ImageUploader

  default_scope { order(position: :asc) }


  def get_image_format(url)
    dirty_format = url.split(".").last

    if dirty_format[0..2] == 'png' || dirty_format[0..2] == 'jpg' || dirty_format[0..2] == 'gif'
      format = dirty_format[0..2]
    elsif dirty_format[0..3] == 'jpeg'
      format = dirty_format[0..3]
    else
      format = "none"
    end

    format
  end

  private
  def reindex
    PgSearch::Multisearch.rebuild(Link)
  end

end
