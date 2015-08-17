class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :common_name
      t.references :league, null: false
      t.references :nation, null: false
      t.references :club, null: false
      t.string :position, null: false
      t.string :play_style
      t.integer :height, null: false
      t.integer :weight, null: false
      t.string :birthdate, null: false
      t.integer :age, null: false
      t.integer :acceleration, null: false
      t.integer :aggression, null: false
      t.integer :agility, null: false
      t.integer :balance, null: false
      t.integer :ballcontrol, null: false
      t.string :foot, null: false
      t.integer :skillMoves, null: false
      t.integer :crossing, null: false
      t.integer :curve, null: false
      t.integer :dribbling, null: false
      t.integer :finishing, null: false
      t.integer :freekickaccuracy, null: false
      t.integer :gkdiving, null: false
      t.integer :gkhandling, null: false
      t.integer :gkkicking, null: false
      t.integer :gkpositioning, null: false
      t.integer :gkreflexes, null: false
      t.integer :headingaccuracy, null: false
      t.integer :interceptions, null: false
      t.integer :jumping, null: false
      t.integer :longpassing, null: false
      t.integer :longshots, null: false
      t.integer :marking, null: false
      t.integer :penalties, null: false
      t.integer :positioning, null: false
      t.integer :potential, null: false
      t.integer :reactions, null: false
      t.integer :shortpassing, null: false
      t.integer :shotpower, null: false
      t.integer :slidingtackle, null: false
      t.integer :sprintspeed, null: false
      t.integer :standingtackle, null: false
      t.integer :stamina, null: false
      t.integer :strength, null: false
      t.integer :vision, null: false
      t.integer :volleys, null: false
      t.integer :weak_foot, null: false
      t.string :traits
      t.string :specialities
      t.string :atk_work_rate, null: false
      t.string :def_work_rate, null: false
      t.string :player_type, null: false
      t.integer :attribute_1, null: false
      t.integer :attribute_2, null: false
      t.integer :attribute_3, null: false
      t.integer :attribute_4, null: false
      t.integer :attribute_5, null: false
      t.integer :attribute_6, null: false
      t.string :name, null: false
      t.string :quality, null: false
      t.string :color, null: false
      t.boolean :is_gk, null: false
      t.string :position_full, null: false
      t.boolean :is_special_type, null: false
      t.string :item_type, null: false
      t.string :fifa_id, null: false
      t.integer :base_id, null: false
      t.integer :rating, null: false

      t.timestamps null: false
    end
  end
end
