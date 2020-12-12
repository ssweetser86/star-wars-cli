require_relative '../lib/environment.rb'

class API

    def initialize
        get_data
        complile_all
    end

    def get_data(url = "https://swapi.dev/api/people/?page=1")
        response = HTTParty.get(url)
        data = JSON.parse(response.body)
        return data
    end

    def compile_all
        sw = get_data
        #data = []
        while sw["next"] != nil
            sw["results"].each { |v| Character.new(v["name"], v["birth_year"], v["homeworld"], v["films"]) }
            sw = get_data(sw["next"])
        end
        sw["results"].each { |v| Character.new(v["name"], v["birth_year"], v["homeworld"], v["films"]) }

    end



end
