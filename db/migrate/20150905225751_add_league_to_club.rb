class AddLeagueToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :league_id, :int
    add_column :leagues, :nation_id, :int
  end
end
