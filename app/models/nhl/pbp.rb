require 'httparty'

class NHL::PBP
  attr_reader :pbp, :plays, :season_id, :game_id, :home_team, :away_team,
              :players, :shifts, :date

  def initialize(code = "2021021275")
    @pbp   = pbp
    @code  = code
    @plays = []

    setup
  end

  private

  def setup
    pbp_url = "https://statsapi.web.nhl.com/api/v1/game/#{@code}/feed/live?site=en_nhl"

    response = HTTParty.get(pbp_url)

    unless response.code == 200
      puts "Error: Something went wrong!"
      return
    end

    @pbp       = JSON.parse(response.to_json, object_class: OpenStruct)

    @season_id = response.dig("gameData", "game", "season").to_i
    @game_id   = response.dig("gameData", "game", "pk")
    @date      = response.dig("gameData", "datetime", "dateTime").to_date

    @away_team = response.dig("gameData", "teams", "away")
    @home_team = response.dig("gameData", "teams", "home")

    @players   = response.dig("gameData", "players")

    @pbp.dig("liveData", "plays", "allPlays").each do |event|
      @plays.push(NHL::PBP::Event.new(pbp, event))
    end
  end
end
