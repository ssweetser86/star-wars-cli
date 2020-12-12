require_relative '../lib/environment.rb'

class API

    def initialize
        get_data
        complile_characters

    end

    def get_data(url = "https://swapi.dev/api/people/?page=1")
        response = HTTParty.get(url)
        data = JSON.parse(response.body)
        return data
    end

    def compile_characters
        sw = get_data
        #data = []
        while sw["next"] != nil
            sw["results"].each { |v| Character.new(v["name"], v["birth_year"], v["homeworld"], v["films"]) }
            sw = get_data(sw["next"])
        end
        sw["results"].each { |v| Character.new(v["name"], v["birth_year"], v["homeworld"], v["films"]) }

    end

    def compile_others
        Character.all.each do |char|
            planet = get_data(char["homeworld"])
            Planet.find_or_create_new(planet["name"], planet["population"], char["homeworld"])



end
