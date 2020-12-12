require_relative '../lib/environment.rb'

class CLI

    def initialize
        puts "Welcome to Star Wars CLI"
        puts "Please wait while your data is compiled for optimal viewing pleasure..."

        API.new

        binding.pry
    end

end

CLI.new