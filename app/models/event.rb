class Event < ApplicationRecord

  belongs_to :location
  belongs_to :creater, foreign_key: :user_id
  has_many :images, as: :imageable
  has_many :comments, as: :commentable
  has_many :invitations
  

  validates :name, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
end
