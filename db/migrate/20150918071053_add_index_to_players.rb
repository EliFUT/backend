class AddIndexToPlayers < ActiveRecord::Migration
  def change
    add_index :players, :club_id
  end
end
