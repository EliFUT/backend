class PlayerSerializer < ActiveModel::Serializer
  attributes(:id, :base_id, :first_name, :last_name, :common_name, :name,
  :position, :image, :rating, :player_type, :attribute_1, :attribute_2,
  :attribute_3, :attribute_4, :attribute_5, :attribute_6, :quality,
  :nation_image, :color)

  def image
    ActionController::Base.helpers.asset_path "players/player_#{object.base_id}.png"
  end

  def nation_image
    ActionController::Base.helpers.asset_path "nations/normal/nation_#{object.nation.base_id}.png"
  end
end
