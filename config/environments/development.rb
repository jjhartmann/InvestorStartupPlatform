Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false


  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = true

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Perform email deliveries in dev mode == true
  config.action_mailer.perform_deliveries = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker


  config.action_mailer.delivery_method = :sparkpost


  # ActionMailer::Base.smtp_settings = {
  #     user_name:            'vma',
  #     password:             'password123#',
  #     address:              'smtp.sparkpostmail.com',
  #     port:                  587,
  #     enable_starttls_auto:  true,
  #     format:               :html
  # }

  config.i18n.default_locale = :'en'

  # config.i18n.default_locale = :'zh-CN' #for Chinese

  config.active_record.time_zone_aware_types = [:datetime, :time]
  config.time_zone = "Mumbai"

  config.action_cable.url = "ws://localhost:3000/cable"
end
