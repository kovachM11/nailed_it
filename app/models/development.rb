class Development < ApplicationRecord
  # Direct associations

  belongs_to :action

  belongs_to :user

  # Indirect associations

  # Validations

end
