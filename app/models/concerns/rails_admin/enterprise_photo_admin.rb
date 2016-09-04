module RailsAdmin::EnterprisePhotoAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Enterprise'
      navigation_icon 'fa fa-photo'
      label_plural 'Photos'

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