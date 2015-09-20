class NationSerializer < ActiveModel::Serializer
  attributes(:id, :base_id, :name, :large_image, :small_image)

  def large_image
    # http://stackoverflow.com/questions/16609814/how-to-use-a-digest-aware-asset-for-default-url-in-rails4/16609815#16609815
    ActionController::Base.helpers.asset_path "nations/large/nation_#{object.base_id}.png"
  end

  def small_image
    ActionController::Base.helpers.asset_path "nations/normal/nation_#{object.base_id}.png"
  end
end
