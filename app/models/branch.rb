class Branch < ActiveRecord::Base
  belongs_to :document
  has_one :current_revision, class_name: "Revision", foreign_key: "branch_id"
  validates :name, presence: true

  def to_s
    name
  end
end
