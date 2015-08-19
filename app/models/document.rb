class Document < ActiveRecord::Base
  belongs_to :branch
  has_many :revisions, dependent: :destroy
  has_one :current_revision, class_name: "Revision", foreign_key: "document_id"
  validates :title, presence: true

  def to_s
    title
  end
end
