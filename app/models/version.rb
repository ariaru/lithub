class Version < ActiveRecord::Base
  belongs_to :document
  belongs_to :user
  belongs_to :parent, inverse_of: :children, class_name: "Version"
  has_many :children, inverse_of: :parent, class_name: "Version", foreign_key: "parent_id"
end
