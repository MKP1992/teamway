
require 'net/http'
require 'json'

module DHH
  class RequestResponse
    
    DEFAULT_ERROR_MESSAGE = 'There was an error retrieving DDH git details.'.freeze
    
    DHH_GIT_ENDPOINTS = {
      api_url: URI('https://api.github.com/users/dhh/events/public')
    }
    
    def self.fecth_api_data
      begin
        res = Net::HTTP.get_response(DHH_GIT_ENDPOINTS[:api_url])
        if res.code != "200"
          puts DEFAULT_ERROR_MESSAGE
        else
          return JSON.parse(res.body)
        end
      rescue Timeout::Error
        puts "Api retrieving data is too long"
      end
    end

  end
end