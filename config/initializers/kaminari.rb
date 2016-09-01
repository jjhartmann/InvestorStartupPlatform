# kaminari Config Page


# Fix for conflict between kaminari and will_paginate
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end