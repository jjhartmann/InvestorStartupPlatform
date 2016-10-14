module RailsAdmin::MeetingAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Navigation'
      navigation_icon 'fa fa-users'
      label_plural 'Meetings'

      create do
        field :topic
        field :start_time
        field :end_time
        field :enterprise_id
        field :acceptance_status , :enum do
          enum do
            MeetingMember::ACCEPT_STATUS
          end
        end
      end

      edit do
        field :topic
        field :start_time
        field :end_time
        field :enterprise_id
        field :acceptance_status , :enum do
          enum do
            MeetingMember::ACCEPT_STATUS
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
