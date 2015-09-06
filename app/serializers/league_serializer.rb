class LeagueSerializer < ActiveModel::Serializer
  attributes(:id, :base_id, :name, :abbrev_name, :image)

  def image
    # http://stackoverflow.com/questions/16609814/how-to-use-a-digest-aware-asset-for-default-url-in-rails4/16609815#16609815
    ActionController::Base.helpers.asset_path "leagues/league_#{object.id}.png"
  end
end
