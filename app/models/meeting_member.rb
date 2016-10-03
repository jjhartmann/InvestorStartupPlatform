class MeetingMember < ApplicationRecord
  belongs_to :meeting
  belongs_to :memberable, polymorphic: true
end
