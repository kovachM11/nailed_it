class Action < ApplicationRecord
  # Direct associations

  has_many   :developments,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
