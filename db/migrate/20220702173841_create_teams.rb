class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.integer :franchise_id
      t.integer :team_id
      t.string :name
      t.string :code
      t.string :city
      t.boolean :active

      t.timestamps
    end
  end
end
