class AddBrasileirao < ActiveRecord::Migration
  def change
    League.create(base_id: -1, name: "Brasileirão", nation_id: 54)
  end
end
