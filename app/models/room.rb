class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations,dependent: :destroy
  has_one_attached :room_image

  validates :room_name, presence: true
  validates :room_detail, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true
  validates :address, presence: true
end
