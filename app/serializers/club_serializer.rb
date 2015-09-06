class ClubSerializer < ActiveModel::Serializer
  attributes(:id, :base_id, :name, :image)

  def image
    # http://stackoverflow.com/questions/16609814/how-to-use-a-digest-aware-asset-for-default-url-in-rails4/16609815#16609815
    ActionController::Base.helpers.asset_path "clubs/large/club_#{object.base_id}.png"
  end
end
