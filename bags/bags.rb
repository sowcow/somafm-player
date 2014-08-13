require_relative 'paths'

def bags *names
  names.each { |name|
    bag = Paths.bags_dir + name.to_s
    Dir.chdir(bag) {
      File.exist? 'Rakefile' or
        raise "Bag not implemented: #{name} at #{Dir.pwd}"
      system 'rake'
    }
  }
end
