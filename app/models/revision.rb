class Revision < ActiveRecord::Base
  belongs_to :branch
  belongs_to :document
  belongs_to :parent, inverse_of: :children, class_name: "Revision"
  has_many :children, inverse_of: :parent, class_name: "Revision", foreign_key: "parent_id"

  validates :summary, presence: true
  validates :body, presence: true
  
  before_save :reassign_parent_and_delete_obsolete_drafts_if_necessary

  protected
    def reassign_parent_and_delete_obsolete_drafts_if_necessary
      obsolete_drafts = []
      if self.status == "publish"
        while self.parent && self.parent.status == "draft"
          obsolete_drafts.push(self.parent)
          self.parent_id = self.parent.parent_id
        end
      end
      obsolete_drafts.each { |draft| draft.delete }
    end

end
