require 'rails/generators/resource_helpers'

##
# Generates services for CRUD and more
module Rails
  module Generators
    class ServicesGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      source_root File.expand_path('templates/services', __dir__)

      def create_services_files
        template 'find_service.rb.tt', File.join("app/services/#{controller_class_path.join("/")}", controller_file_name, 'find_service.rb')
        template 'fetch_service.rb.tt', File.join("app/services/#{controller_class_path.join("/")}", controller_file_name, 'fetch_service.rb')
        template 'filters_service.rb.tt', File.join("app/services/#{controller_class_path.join("/")}", controller_file_name, 'filters_service.rb')
        template 'insert_service.rb.tt', File.join("app/services/#{controller_class_path.join("/")}", controller_file_name, 'insert_service.rb')
        template 'update_service.rb.tt', File.join("app/services/#{controller_class_path.join("/")}", controller_file_name, 'update_service.rb')
        template 'delete_service.rb.tt', File.join("app/services/#{controller_class_path.join("/")}", controller_file_name, 'delete_service.rb')
      end

      private

      def versionist?
        Gem.loaded_specs.has_key?('versionist')
      end

    end
  end
end
