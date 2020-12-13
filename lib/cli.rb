require_relative '../lib/environment.rb'

class CLI

    def initialize
        puts "Welcome to Star Wars CLI"
        puts "Please wait while your data is compiled for optimal viewing pleasure (this will take a while)..."
        
        API.new
    end

    def get_input
        x = gets.chomp
        return x.downcase
    end

    def clear_scr
        system("clear") || system("cls")
    end

    def call
        clear_scr
        puts Character.all.count
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

    def char_menu(index)
        clear_scr
        base = index * 10
        puts "Please select a character to view more about. To see more characters, enter next to go forward or previous to go back. #{base}"
        for i in 0..9
            if Character.all[base+i] != nil
                puts "#{base+i+1}.  #{Character.all[base+i].name}"
            end
        end
        choice = get_input
        char_menu(index+1) if choice == 'next' && index < Character.all.count / 10
        char_menu(index-1) if choice == 'previous' && index > 0
        char_menu(index) if Character.all[base+choice.to_i-1] == nil
        view_char(Character.all[base+choice.to_i-1])
        #binding.pry
        #for i in 0..9
        #    puts 
    end

    def planet_menu(index)
        clear_scr
    end

    def film_menu
        clear_scr
    end

    def view_char(char)
        clear_scr
        puts "Name:      #{char.name}"
        puts "DOB:       #{char.dob}"
        puts "Homeworld: #{Planet.find_by_id(char.homeworld)}"
        puts "Films:"
            for i in 0...char.films.count
                puts Film.find_by_id(char.films[i])
            end
        gets.chomp
        call 
    end

    def view_planet(index)
        clear_scr
    end

    def view_film(index)
        clear_scr
    end

end

x = CLI.new
x.call