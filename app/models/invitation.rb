class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :receiver, foreign_key: :user_id   
end
