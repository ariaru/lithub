class Version < ActiveRecord::Base
  belongs_to :author
  belongs_to :parent, class_name: "Version"
  has_one :document
  has_many :children, class_name: "Version", foreign_key: "parent_id"
end
