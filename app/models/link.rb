class Link < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :url, :format => URI::regexp(%w(http https))
  validates :board_id, presence: true

  mount_uploader :image, ImageUploader

  default_scope { order(created_at: :desc) }

  after_create :fetch_metadata

  def fetch_metadata
    metadata = LinkThumbnailer.generate(url)

    if metadata.images.first.try(:src)
      url = metadata.images.first.src.to_s
      format = get_image_format(url)
      random = Random.new_seed.to_s
      filename = File.join(Rails.root, 'tmp/temp_image' + random + '.' + format)

      open(filename, 'wb') do |file|
        file << open(URI.encode(url)).read
      end

      self.image = File.open(File.join(Rails.root, 'tmp/temp_image' + random + '.' + format))
    end

    self.title = metadata.title
    self.save

    puts self.image
    puts self.image == ""
    puts self.image != ""

    puts self.image.url

    if self.image.url
      File.delete(File.join(Rails.root, 'tmp/temp_image' + random + '.' + format))
    end
  end

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

end
