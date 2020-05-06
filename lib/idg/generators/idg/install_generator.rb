module Idg
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      argument :name, type: :string, default: ''

      def copy_scaffold_controller_template
        copy_file "api_controller.rb.tt", "lib/templates/rails/scaffold_controller/api_controller.rb"
        copy_file "api_controller.rb.tt", "lib/templates/rails/scaffold_controller/controller.rb"
      end

    end
  end
end
