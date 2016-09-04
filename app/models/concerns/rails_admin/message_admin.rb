module RailsAdmin::MessageAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Communication'
      navigation_icon 'fa fa-envelope'
      label_plural 'Messages'

      edit do
      end

      show do
      end

      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end
end