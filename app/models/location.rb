class Location < ApplicationRecord

  belongs_to :creater, foreign_key: :user_id
  belongs_to :event
  has_many :images, as: :imageable
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :address_line_1, presence: true
  validates_format_of :zip_code,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "should be 12345 or 12345-1234",
                  allow_blank: false

end
