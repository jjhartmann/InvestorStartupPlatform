class ProfileVisitor < ApplicationRecord
  belongs_to :visitee, :class_name => "User", :foreign_key => :visitee_id
  belongs_to :visitor, :class_name => "User", :foreign_key => :visitor_id

  # private
  #
  # def self.visitors(user)
  #   where(visitee_id: user)
  # end
end
