class Revision < ActiveRecord::Base
  validates :summary, presence: true
  validates :body, presence: true
  belongs_to :document
  belongs_to :user
  has_many :children, inverse_of: :parent, class_name: "Revision", foreign_key: "parent_id"# , dependent: :nullify
  belongs_to :parent, inverse_of: :children, class_name: "Revision" 
end
