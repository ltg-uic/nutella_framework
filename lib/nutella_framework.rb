# Import all the modules
require 'logging/nutella_logging'
require 'core/nutella_core'
require 'config/config'
require 'config/runlist'
require 'config/current_project'
require 'cli/nutella_cli'

module Nutella
  home_dir = File.dirname(__FILE__)
  NUTELLA_HOME = home_dir[0..-4]

  # If the nutella configuration file (config.json) is empty (or doesn't exist) we're going to initialize it
  # with nutella constants and defaults
  if Nutella.config.empty?
    Nutella.init
  end
  
end
