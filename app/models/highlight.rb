# == Schema Information
#
# Table name: highlights
#
#  id            :integer          not null, primary key
#  date          :date
#  playback      :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  nhl_event_id  :integer
#  nhl_game_id   :integer
#  nhl_season_id :integer
#  player_id     :integer          not null
#  team_id       :integer          not null
#
# Indexes
#
#  index_highlights_on_player_id  (player_id)
#  index_highlights_on_team_id    (team_id)
#
# Foreign Keys
#
#  player_id  (player_id => players.id)
#  team_id    (team_id => teams.id)
#
class Highlight < ApplicationRecord
  belongs_to :player
  belongs_to :team

  def default_playback
    playback.find { |media| media["name"] == "FLASH_1800K_896x504" }
  end
end
