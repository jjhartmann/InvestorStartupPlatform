module RailsAdmin::TargetFollowerAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'User'
      navigation_icon 'fa fa-connectdevelop'
      label_plural 'Relationships'

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