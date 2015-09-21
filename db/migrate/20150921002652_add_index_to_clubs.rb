class AddIndexToClubs < ActiveRecord::Migration
  def change
    add_index :clubs, :league_id
  end
end
