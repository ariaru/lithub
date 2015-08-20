class Branch < ActiveRecord::Base
  belongs_to :repository
  has_many :documents, dependent: :destroy
  has_many :revisions, dependent: :destroy
  accepts_nested_attributes_for :documents, reject_if: proc { |attr| attr[:title].blank? }, allow_destroy: true
  accepts_nested_attributes_for :revisions, reject_if: proc { |attr| attr[:summary, :body].blank? }, allow_destroy: true

  validates :name, presence: true

  def to_s
    name
  end
end
