class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :nationality
      t.string :position
      t.string :nhl_player_id

      t.timestamps
    end
  end
end
