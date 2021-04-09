class User < ApplicationRecord
  # юзер может создавать много постов
  has_many :posts

  # У юзера должно быть имя не длиннее 35 букв
  validates :username, presence: true, length: { maximum: 35 }
end
