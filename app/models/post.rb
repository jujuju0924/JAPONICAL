class Post < ApplicationRecord
  mount_uploader :image, ImagesUploader
  validates :name, presence: true
  validates :address, presence: true
  validates :image, presence: true
  has_one :user

end
