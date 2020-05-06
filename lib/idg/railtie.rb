module Idg
  class Railtie < ::Rails::Railtie

    # Register generators
    config.app_generators do
      puts File.dirname __dir__
      require "#{ File.dirname __dir__ }/idg/generators/idg/install_generator.rb"
      # require "#{ File.dirname __dir__ }/generators/idg/resource_override.rb"
    end

  end
end
