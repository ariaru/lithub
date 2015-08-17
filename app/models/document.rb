class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :repository
  has_many :branches
  accepts_nested_attributes_for :branches, allow_destroy: true
end
