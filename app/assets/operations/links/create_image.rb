# module Links
#   class CreateImage < BaseOperation
#     def initialize(link)
#       super
#
#       metadata = LinkThumbnailer.generate(link.url)
#
#       if metadata.images.first.try(:src)
#         url = metadata.images.first.src.to_s
#         format = get_image_format(url)
#         random = Random.new_seed.to_s
#         filename = File.join(Rails.root, 'tmp/temp_image' + random + '.' + format)
#
#         open(filename, 'wb') do |file|
#           file << open(URI.encode(url)).read
#         end
#
#         link.image = File.open(File.join(Rails.root, 'tmp/temp_image' + random + '.' + format))
#       end
#
#       link.title = metadata.title
#       link.description = metadata.description
#       link.save
#
#       puts link.image
#       puts link.image == ""
#       puts link.image != ""
#
#       puts link.image.url
#
#       if link.image.url
#         File.delete(File.join(Rails.root, 'tmp/temp_image' + random + '.' + format))
#       end
#
#       link.save!
#
#       set_state true
#     rescue => e
#       add_exception(e)
#       set_state false
#     end
#   end
# end
