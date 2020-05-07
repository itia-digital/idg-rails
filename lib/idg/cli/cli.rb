require 'active_support/all'
require 'thor'
require 'yaml'

module Idg
  class CLI < Thor

    desc 'g', 'Runs rails g with inline options or through --yml file'
    long_desc <<-LONGDESC
      With --yml option, s sample for yml file content is:
      ```
        user:
            generator: user_profile
                user:references:required
                about_me:text:required
      ```
    LONGDESC
    option :yml
    def g(*params)

      if params.length == 0
        puts 'I D G : Please include a valid generator, checkout `rails g -h`'
      else
        rails_cmd = "rails g #{params[0]}"

        if options[:yml]
          run_yaml(options[:yml], rails_cmd)
        elsif params.length == 1
          puts "I D G : No [#{rails_cmd}] params present"
        else
          cmd_params = params[1, params.length - 1].join(' ').to_s
          run_rails_commands(rails_cmd, cmd_params)
        end
      end

    end

    private

    def run_rails_commands(rails_command, params)
      cmd = "#{rails_command} #{params}"
      puts "I D G :  Running [ #{cmd} ]"
      system(cmd)
    end

    def run_yaml(path, rails_command)
      file_path = get_file_path(path)

      if file_path.present?
        commands = HashWithIndifferentAccess.new(YAML.load_file(file_path))
        run_yaml_commands(rails_command, commands)
      else
        puts 'I D G : File not found, pass root or full path'
      end
    end

    def run_yaml_commands(rails_command, commands)
      commands.each do |key, value|
        if value["generator"]
          puts "===== < R U N N I N G :  #{key} >====="
          run_rails_commands(rails_command, value["generator"])
        end

        run_yaml_commands(value['references'], rails_command) if value['references'].present?
      end
    end

    def get_file_path path
      if File.exist?(path)
        path
      elsif File.exist?("#{Dir.pwd}/#{path}")
        "#{Dir.pwd}/#{path}"
      end
    end

  end
end