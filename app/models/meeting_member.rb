class MeetingMember < ApplicationRecord
  belongs_to :meeting
  belongs_to :memberable, polymorphic: true


  ACCEPT_STATUS = ["requested","accepted","rejected"]
end
