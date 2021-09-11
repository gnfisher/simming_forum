require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module SimmingForum
  class Application < Rails::Application
    config.load_defaults 6.1

    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.active_job.queue_adapter = :delayed_job
  end
end
