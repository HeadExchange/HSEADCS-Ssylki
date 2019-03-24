# module Links
#   class Create < BaseOperation
#     attr_reader :link
#
#     def initialize(options = {})
#       super
#
#       @link = Link.create!(options)
#       CreateThumbnail.perform_async(@link)
#
#       set_state true
#     rescue => e
#       add_exception(e)
#       set_state false
#     end
#   end
# end
