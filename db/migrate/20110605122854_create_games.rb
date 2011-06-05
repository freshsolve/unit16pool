class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :player_id
      t.integer :opponent_id
      t.integer :winner

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
