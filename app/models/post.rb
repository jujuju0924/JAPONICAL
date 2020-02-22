class Post < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :image, presence: true
end
