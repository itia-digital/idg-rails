module Idg
  class Railtie < ::Rails::Railtie

    require "#{ File.dirname __dir__ }/idg/init.rb"

    # TODO Fix warning
    # Deprecation warning: Expected boolean default value for '--helper'; got :services (string).
    # This will be rejected in the future unless you explicitly pass the options `check_default_type: false` or call `allow_incompatible_default_type!` in your code
    # You can silence deprecations warning by setting the environment variable THOR_SILENCE_DEPRECATION.

    generators = config.respond_to?(:app_generators) ? config.app_generators : config.generators
    generators.helper :services

  end
end
