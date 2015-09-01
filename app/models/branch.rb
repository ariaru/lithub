class Branch < ActiveRecord::Base
  belongs_to :repository

  belongs_to :parent, inverse_of: :children, class_name: "Branch"
  has_many :children, inverse_of: :parent, class_name: "Branch", foreign_key: "parent_id", dependent: :destroy
  
  has_many :documents, dependent: :destroy
  has_many :revisions, dependent: :destroy

  accepts_nested_attributes_for :documents, reject_if: proc { |attr| attr[:title].blank? }, allow_destroy: true
  accepts_nested_attributes_for :revisions, reject_if: proc { |attr| attr[:summary, :body].blank? }, allow_destroy: true

  validates :name, presence: true

  def to_s
    name
  end
end
