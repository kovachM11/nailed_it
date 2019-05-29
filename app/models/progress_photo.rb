class ProgressPhoto < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

end
