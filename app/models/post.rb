class Post < ApplicationRecord
  acts_as_taggable
  mount_uploader :image, ImagesUploader
  validates :name, presence: true
  validates :address, presence: true
  validates :image, presence: true
  belongs_to :user
  geocoded_by :address
  after_validation :geocode,if: :address_changed?
  has_many :likes, dependent: :destroy


  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

end
