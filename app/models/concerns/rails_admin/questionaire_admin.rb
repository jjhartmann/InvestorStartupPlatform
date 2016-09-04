module RailsAdmin::QuestionaireAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Questionnaire'
      navigation_icon 'fa fa-question-circle-o'
      label_plural 'Questionnaires'

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