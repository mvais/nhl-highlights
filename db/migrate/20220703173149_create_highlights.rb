class CreateHighlights < ActiveRecord::Migration[7.0]
  def change
    create_table :highlights do |t|
      t.integer :nhl_event_id
      t.integer :nhl_game_id
      t.integer :nhl_season_id
      t.references :player, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.date :date
      t.json :playback

      t.timestamps
    end
  end
end
