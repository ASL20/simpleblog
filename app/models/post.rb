class Post < ApplicationRecord
  # пост имеет только одного юзера
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user, presence: true

  # длина названия поста не должна превышать 255 символов
  validates :title, presence: true, length: { maximum: 255 }
  # длина содержимого поста не должна превышать 1000 символов
  validates :content, presence: true, length: { maximum: 1000 }
end
