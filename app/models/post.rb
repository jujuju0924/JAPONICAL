class Post < ApplicationRecord
  mount_uploader :image, ImagesUploader
  validates :name, presence: true
  validates :address, presence: true
  validates :image, presence: true
  belongs_to :user
  geocoded_by :address
  after_validation :geocode

end
