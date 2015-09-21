class ClubsController < ApplicationController
  respond_to :json

  def index
    if params[:league_id]
      respond_with Club.where(league_id: params[:league_id]).order('name asc')
    else
      respond_with Club.all.order('name asc')
    end
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
