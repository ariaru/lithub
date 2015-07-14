class Version < ActiveRecord::Base
  belongs_to :author
  belongs_to :parent
end
