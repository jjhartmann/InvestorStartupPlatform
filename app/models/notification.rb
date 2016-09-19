class Notification < ApplicationRecord
  
  # Polymopic Profile Association
  belongs_to :notificable, polymorphic: true, optional: true
end
