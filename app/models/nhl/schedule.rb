require 'httparty'
require 'pry'

class NHL::Schedule
    attr_reader :dates, :season, :startDate, :endDate

    def initialize(season, startDate = nil, endDate = nil)
        @season = season
        @startDate = startDate || seasons[season]['startDate']
        @endDate = endDate || seasons[season]['endDate']

        setup
    end

    private

    def seasons
        JSON.parse(
            {
                "20212022": {
                    "startDate": "2021-10-12",
                    "endDate": "2022-06-26"
                }
            }.to_json
        )
    end

    def setup
        schedule_url = "https://statsapi.web.nhl.com/api/v1/schedule?startDate=#{startDate}&endDate=#{endDate}"

        response = HTTParty.get(schedule_url)

        unless response.code == 200
            puts "Error: Something went wrong!"
            return
        end
        
        schedule = JSON.parse(response.to_json, object_class: OpenStruct)

        @dates = schedule.dates
    end    
end