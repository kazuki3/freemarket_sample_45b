class Image < ApplicationRecord
  belongs_to :product, optional: true, inverse_of: :images
  mount_uploader :image_path, ImageUploader
  # validates :image_path, presence: true
  validates_presence_of :product
end
