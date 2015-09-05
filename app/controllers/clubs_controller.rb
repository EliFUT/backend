class ClubsController < ApplicationController
  respond_to :json

  def index
    respond_with Club.all.order('name asc')
  end

  def show
    respond_with Club.find(params[:id])
  end

  def random
    respond_with Club.where(nation_id: params[:nation_id])
      .order('random()')
      .pluck(:id)
      .take(1)
  end
end
