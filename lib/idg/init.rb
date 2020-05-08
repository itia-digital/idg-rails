# Register: install generator
require "#{ File.dirname __dir__ }/idg/generators/install_generator.rb"

# Register: services generator
require "#{ File.dirname __dir__ }/idg/generators/services_generator.rb"

# Register concerns
require "#{ File.dirname __dir__ }/idg/concerns/models/string_enum"
require "#{ File.dirname __dir__ }/idg/concerns/controllers/listable_controller"

# Register services
require "#{ File.dirname __dir__ }/idg/services/service"
require "#{ File.dirname __dir__ }/idg/services/find_service"
require "#{ File.dirname __dir__ }/idg/services/fetch_service"
require "#{ File.dirname __dir__ }/idg/services/fetch_catalog_service"
