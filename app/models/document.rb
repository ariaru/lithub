class Document < ActiveRecord::Base
  belongs_to :initiator
  belongs_to :current_version
end
