class Picture < ApplicationRecord
  mount_uploader :photo, ImageUploader
  belongs_to :imageable, polymorphic: true
end
