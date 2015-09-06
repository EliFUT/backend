class ClubsController < ApplicationController
  respond_to :json

  def index
    respond_with Club.all.order('name asc')
  end

  def show
    respond_with Club.find(params[:id]), root: false
  end

  def random
    league_ids = League.where(nation_id: params[:nation_id]).pluck(:id)
    respond_with Club.where(league_id: league_ids)
      .order('random()')
      .limit(1)
      .first, root: false
  end
end
