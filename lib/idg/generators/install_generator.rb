require 'rails/generators'

##
# Generates default working format for controllers.
# Taken from [here](https://github.com/rails/rails/tree/e1b29b40a2960431d0f82a246faf4f9b62a0a0b7/railties/lib/rails/generators/rails/scaffold_controller/templates)
#
module Idg
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates/install', __dir__)

      argument :name, type: :string, default: ''

      def copy_scaffold_controller_template
        copy_file 'api_controller.rb.tt', 'lib/templates/rails/scaffold_controller/api_controller.rb'
        copy_file 'api_controller.rb.tt', 'lib/templates/rails/scaffold_controller/controller.rb'
      end

    end
  end
end
