class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  #ユーザーイメージの追加
  has_many :rooms
  has_many :reservations
  has_one_attached :user_image
end
