# kaminari Config Page


# Fix for conflict between rails_admin and will_paginate
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end