class Post < ApplicationRecord
  # пост имеет только одного юзера
  belongs_to :user

  # длина названия поста не должна превышать 255 символов
  validates :title, presence: true, length: { maximum: 255 }
  validates :text, presence: true, length: { maximum: 1000 }
end
