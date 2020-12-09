require_relative '../lib/environment.rb'

class API

    #URL = "https://swapi.dev/api/people/"

    def get_data(url = "https://swapi.dev/api/people/?page=1")
        uri = URI.parse(url)
        binding.pry
        uri.scheme = "https"
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        return data
    end

    def compile_all
        sw = get_data
        data = []
        #binding.pry
        while sw["next"] != nil
            sw["results"].each { |v| data << v }
            sw = get_data(sw["next"])
        end
        return data

    end



end

sw = API.new
sw.compile_all