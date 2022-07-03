class NHL::PBP::PlayerCreator < ApplicationService
  def initialize(pbp_players, id)
    @players = pbp_players
    @id = id
  end

  def call
    json = @players["ID#{@id}"]

    Player.find_or_create_by(nhl_player_id: json.dig('id')) do |player|
      player.first_name = json.dig("firstName")
      player.last_name = json.dig("lastName")
      player.nationality = json.dig("nationality")
      player.position = json.dig("primaryPosition", "name")
    end
  end
end
