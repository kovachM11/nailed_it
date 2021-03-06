class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :developments,
             :dependent => :destroy

  has_many   :progress_photos,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
