module RailsAdmin::QuestionAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Questionnaire'
      navigation_icon 'fa fa-question-circle'
      label_plural 'Questions'

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