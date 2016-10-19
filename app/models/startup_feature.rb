class StartupFeature < ApplicationRecord
  belongs_to :user_profile

  # 
  # config.model 'StartupFeature' do
  #   object_label_method do
  #     :user_name
  #   end
  # end
  #
  # def user_name
  #   return self.user.name
  # end
end
