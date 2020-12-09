require_relative '../lib/environment.rb'

class API

    URL = "https://swapi.dev/api/people/"

    def get_data
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        return data
    end


end

sw = API.new
binding.pry