# Require all commands by iterating through all the files
# in the commands directory
Dir["#{File.dirname(__FILE__)}/../commands/*.rb"].each do |file|
  # noinspection RubyResolve
  require "commands/#{File.basename(file, File.extname(file))}"
end

module Nutella
      
    # This method executes a particular command
    # @param command [String] the name of the command
    # @param args [Array<String>] command line parameters passed to the command
    def Nutella.execute_command (command, args=nil)
      # Check that the command exists and if it does,
      # execute its run method passing the args parameters
      if command_exists?(command)
        Object::const_get("Nutella::#{command.capitalize}").new.run(args)
      else
        console.error "Unknown command #{command}"
      end
    end
    
    # This method checks that a particular command exists
    # @return [Boolean] true if the command exists, false otherwise
    def Nutella.command_exists?(command)
      return Nutella.const_get("Nutella::#{command.capitalize}").is_a?(Class)
    rescue NameError
      return false
    end
    
    # This method initializes the nutella configuration file (config.json) with:
    # - config_dir: directory where the configuration files are stored in
    # - broker_dir: directory where the local broker is installed in
    # - main_interface_port: the port used to serve interfaces
    def Nutella.init
      Nutella.config['config_dir'] = "#{ENV['HOME']}/.nutella/"
      Nutella.config['broker_dir'] = "#{Nutella.config['config_dir']}broker/"
      Nutella.config['main_interface_port'] = 57880
    end

end