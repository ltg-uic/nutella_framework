require_relative '../command'

# TODO templates form URL

class Add < Command
  @description = "Copies an arbitrary template (from directory or URL) into the current project"
  
  def run(args=nil)
    # Is current directory a nutella prj?
    if !nutellaPrj?
      return 1
    end
    # Does the template exist?
    if !File.directory?(args[0])
      puts "Template #{args[0]} doesn't exist, can't add template"
      return 1
    end
    # Does the directory in the project exist?
    if !File.directory?("#{@prj_dir}/#{args[1]}")
      puts "Directory #{args[1]} doesn't exist, can't add template"
      return 1
    end
    # Am I trying to copy onto a template that already exists?
    if File.directory?("#{@prj_dir}/#{args[1]}/#{File.basename(args[0])}")
      puts "Template #{File.basename(args[0])} already exists in #{args[1]}, can't add template"
      return 1
    end
    print "Adding template #{File.basename(args[0])}..."
    FileUtils.copy_entry args[0], "#{@prj_dir}/#{args[1]}/#{File.basename(args[0])}"
    puts " DONE"
    return 0
  end
end