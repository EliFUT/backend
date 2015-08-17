class CreateNations < ActiveRecord::Migration
  def change
    create_table :nations do |t|
      t.integer :base_id, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
