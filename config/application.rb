require_relative 'boot'
require 'rails/all'
require 'iconv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DiySaas
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

=begin
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    config.serve_static_files = true
    # 生产环境样式
    config.assets.enabled = true
    config.assets.prefix = "/assets"
    # config.cache_store = :redis_store, { expires_in: 90.minutes }
    config.assets.precompile += [
      'application.css',

      'application.js'
    ]
=end
    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.i18n.default_locale = :'zh-CN'
    config.middleware.use "PDFKit::Middleware", :print_media_type => true
    config.active_record.raise_in_transactional_callbacks = true
    config.action_mailer.raise_delivery_errors = true

    # config.generators do |g|
    #   g.test_framework :rspec,
    #     fixtures: true,
    #     view_specs: false,
    #     helper_specs: false,
    #     routing_specs: false,
    #     request_specs: false
    #   g.fixture_replacement :factory_girl, dir: 'spec/factories'
    # end
  end
end
