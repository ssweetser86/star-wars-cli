require_relative '../lib/environment.rb'

class API

    def get_data(url = "https://swapi.dev/api/people/?page=1")
        response = HTTParty.get(url)
        data = JSON.parse(response.body)
        return data
    end

    def compile_all
        sw = get_data
        data = []
        while sw["next"] != nil
            sw["results"].each { |v| data << v }
            sw = get_data(sw["next"])
        end
        sw["results"].each { |v| data << v }
        return data

    end



end

sw = API.new
data = sw.compile_all
binding.pry