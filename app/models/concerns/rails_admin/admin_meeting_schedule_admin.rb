module RailsAdmin::AdminMeetingScheduleAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Navigation'
      navigation_icon 'fa fa-calendar'
      label_plural 'Meetings Schedules'

      create do
        field :investor_profile
        field :start_time
        field :end_time
        field :day , :enum do
          enum do
            Date::DAYNAMES
          end
        end
      end

      edit do
        field :investor_profile
        field :start_time
        field :end_time
        field :day , :enum do
          enum do
            Date::DAYNAMES
          end
        end
      end

      show do
      end

      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end
end
