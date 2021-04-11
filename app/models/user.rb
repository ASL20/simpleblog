class User < ApplicationRecord
  # Добавляем к юзеру функции Девайза, перечисляем конкретные наборы функций
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Юзер может иметь много постов
  has_many :posts
  has_many :comments, dependent: :destroy

  # У юзера должно быть имя не длиннее 35 букв
  validates :username, presence: true, length: { maximum: 35 }
  # Юзернейм должен быть уникальным
  validates :username, uniqueness: true
end
