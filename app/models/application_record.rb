class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # module ApplicationRecord
  #   def to_slug(string)
  #     string.parameterize.truncate(80, omission: '')
  #   end
  # end

end
