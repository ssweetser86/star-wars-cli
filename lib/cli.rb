require_relative '../lib/environment.rb'

class CLI

    def initialize
        puts "Welcome to Star Wars CLI"
        puts "Please wait while your data is compiled for optimal viewing pleasure (this will take a while)..."

        #API.new
    end

    def get_input
        x = gets.chomp
        return x.downcase
    end

    def call
        system("clear") || system("cls")
        puts "Which would you like to know more about? (Type exit to quit)"
        puts "1. Characters"
        puts "2. Planets"
        puts "3. Films"
        choice = get_input
        while choice != "exit" do
            char_menu(0) if choice == '1'
            planet_menu(0) if choice == '2'
            film_menu if choice == '3'
            return nil if choice == 'exit'
            puts "Please enter a valid choice."
            choice = get_input
        end

    end

end

x = CLI.new
x.call