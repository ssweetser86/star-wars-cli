require_relative '../lib/environment.rb'

class CLI

    def initialize
        clear_scr
        puts "Welcome to Star Wars CLI"
        puts "Please wait while your data is compiled for optimal viewing pleasure (this will take a while)..."
        print "\n\n\nLoading "
        
        API.new
    end

    def clear_scr
        system("clear") || system("cls")
    end

    def call(error=false)
        clear_scr
        puts "!!!You must enter a valid selection!!!" if error == true
        puts "Which would you like to know more about? (Type exit to quit)"
        puts "1. Characters"
        puts "2. Planets"
        puts "3. Films"
        print "\n\nEnter your selection: "
        choice = gets.chomp
        binding.pry
        return nil if choice.downcase == 'exit'
        char_menu(0) if choice == '1'
        planet_menu(0) if choice == '2'
        film_menu if choice == '3'
    
        call(true)

    end

    def char_menu(index)
        clear_scr
        base = index * 10
        puts "Please select a character to view more about. To see more characters, enter next to go forward or previous to go back. Type exit to go back to the main menu"
        for i in 0..9
            if Character.all[base+i] != nil
                puts "#{base+i+1}.  #{Character.all[base+i].name}"
            end
        end
        choice = gets.chomp
        call if choice == 'exit'
        char_menu(index+1) if choice.downcase == 'next' && index < Character.all.count / 10
        char_menu(index-1) if choice.downcase == 'previous' && index > 0
        view_char(Character.all[choice.to_i-1]) if (1..Character.all.count).include?(choice.to_i)
        char_menu(index)
    end

    def planet_menu(index)
        clear_scr
        base = index * 10
        puts "Please select a planet to view more about. To see more planets, enter next to go forward or previous to go back. Type exit to go back to the main menu."
        for i in 0..9
            if Planet.all[base+i] != nil
                puts "#{base+i+1}.  #{Planet.all[base+i].name}"
            end
        end
        choice = gets.chomp
        call if choice == 'exit'
        planet_menu(index+1) if choice.downcase == 'next' && index < Planet.all.count / 10 - 1
        planet_menu(index-1) if choice.downcase == 'previous' && index > 0
        view_planet(Planet.all[choice.to_i-1]) if (1..Planet.all.count).include?(choice.to_i)
        planet_menu(index)
    end

    def film_menu
        clear_scr
        puts "Please select a film to learn more about."
        Film.all.each.with_index(1) do | f, i |
            puts "#{i}. #{f.name}"
        end
        choice = gets.chomp
        view_film(Film.all[choice.to_i-1])
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
        puts "\n\n\nEnter any value to go back to the main menu."
        gets.chomp
        call 
    end

    def view_planet(planet)
        clear_scr
        puts "Name:       #{planet.name}"
        puts "Population: #{planet.population}"
        puts "Notable residents:"
            for i in 0...planet.residents.count
                puts Character.find_by_id(planet.residents[i])
            end
        puts "\n\n\nEnter any value to go back to the main menu."
        gets.chomp
        call
    end

    def view_film(film)
        clear_scr
        puts "Title: #{film.name}"
        puts "Director: #{film.director}"
        puts "\n\nOpening Crawl\n\n#{film.crawl}"
        gets.chomp
        call
    end

end

x = CLI.new
x.call