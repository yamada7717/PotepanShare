class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_people, presence: true, numericality: { greater_than: 0 }
  validate :start_date_after_end_date

  def start_date_after_end_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "チェックアウト日がチェックイン日より後の日付にしてください")
    end
  end

  def total_price
  price_per_night = room.price
  people = number_of_people
  stay = end_date.day - start_date.day
  total_price = (price_per_night * people) * stay
  end
end
