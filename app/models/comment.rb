class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, foreign_key: :user_id
end
