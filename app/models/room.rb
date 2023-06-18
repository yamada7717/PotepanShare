class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :room_image

  validates :room_name, presence: true
  validates :room_detail, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
