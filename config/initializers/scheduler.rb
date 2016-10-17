require 'rubygems'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1h' do
  Meeting.all.each do |meeting|
    if meeting.start_time <= Time.now
      if meeting.acceptance_status != "accepted"
        meeting.update(acceptance_status: "rejected")
      end
    end
  end
end
