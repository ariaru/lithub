class Document < ActiveRecord::Base
  belongs_to :branch
  has_many :revisions, dependent: :destroy
  has_one :current_revision, class_name: "Revision", foreign_key: "document_id"
  accepts_nested_attributes_for :revisions, reject_if: proc { |attr| attr[:summary, :body].blank? }, allow_destroy: true
  
  validates :title, presence: true

  def to_s
    title
  end
end
