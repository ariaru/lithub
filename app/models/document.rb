class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :repository
  has_many :branches, dependent: :destroy
  accepts_nested_attributes_for :branches, reject_if: proc { |attr| attr[:name].blank? }, allow_destroy: true
  validates :title, presence: true

  def to_s
    title
  end
end
