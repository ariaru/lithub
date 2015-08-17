class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :repository
  has_many :branches
end
