class Branch < ActiveRecord::Base
  has_many :documents, dependent: :destroy
  accepts_nested_attributes_for :documents, reject_if: proc { |attr| attr[:title].blank? }, allow_destroy: true
  validates :name, presence: true

  def to_s
    name
  end
end
