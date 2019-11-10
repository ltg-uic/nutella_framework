require_relative 'persisted_hash'

module Nutella
  class Config
    # This method initializes the nutella configuration file (config.json) with:
    # - config_dir: directory where the configuration files are stored in
    # - broker_dir: directory where the local broker is installed in
    # - immortal_dir: directory used to store immortal yaml files
    # - main_interface_port: the port used to serve interfaces
    def self.init
      file['src_dir'] = NUTELLA_SRC
      file['tmp_dir'] = NUTELLA_TMP
      file['home_dir'] = NUTELLA_HOME
      file['main_interface_port'] = 57880
    end

    # Calling this method returns a PersistedHash instance
    # "linked" to the config.json file in the nutella home directory
    def self.file
      PersistedHash.new( "#{ENV['HOME']}/.nutella/config.json" )
    end
  end
end