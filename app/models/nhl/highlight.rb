require 'httparty'

class NHL::Highlight
  attr_reader :events, :code

  def initialize(code = "2021021275")
    @code = code
    @events = []

    setup
  end

  private

  def setup
    highlights_url = "https://statsapi.web.nhl.com/api/v1/game/#{@code}/content"

    response = HTTParty.get(highlights_url)

    unless response.code == 200
      puts "Error: Something went wrong!"
      return
    end

    @events = response.dig('highlights', 'scoreboard', 'items').map { |highlight| NHL::Highlight::Event.new(highlight, @code) }
    @events = @events.uniq { |highlight| [highlight.event_id] }
  end
end
