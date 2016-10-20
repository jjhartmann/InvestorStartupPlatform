class HeaderLogo < ApplicationRecord
  validate :cannot_create_record, on: :create
  # before_destroy :cannot_delete

  mount_uploader :logo, HeaderLogoUploader

  rails_admin do
    navigation_label 'Settings'
    navigation_icon 'fa fa-cog'
    label_plural 'Header Logo'
  end

  private
  def cannot_create_record
   if HeaderLogo.all.count >= 1
     errors[:base] << "You can only have one header logo"
   end
  end

  # def cannot_delete
  #   if HeaderLogo.all.count == 1
  #     puts HeaderLogo.all.as_json
  #     errors[:base] << "You can not delete"
  #     false
  #   end
  # end

end
