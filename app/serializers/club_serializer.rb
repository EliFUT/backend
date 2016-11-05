class ClubSerializer < ActiveModel::Serializer
  attributes(:id, :base_id, :abbrev_name, :name, :small_image, :large_image, :league_id)

  def large_image
    # http://stackoverflow.com/questions/16609814/how-to-use-a-digest-aware-asset-for-default-url-in-rails4/16609815#16609815
    ActionController::Base.helpers.asset_path "images/clubs/large/club_#{object.base_id}.png"
  end

  def small_image
    ActionController::Base.helpers.asset_path "images/clubs/normal/club_#{object.base_id}.png"
  end
end
