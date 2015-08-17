class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.integer :base_id, null: false
      t.string :name, null: false
      t.string :abbrev_name

      t.timestamps null: false
    end
  end
end
