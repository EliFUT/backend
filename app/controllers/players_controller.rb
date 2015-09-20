class PlayersController < ApplicationController
  respond_to :json

  def show
    respond_with Player.find(params[:id])
  end

  def index
    respond_with Player.offset((params[:page] || 0).to_i * 25).limit(25)
  end

  def squad
    respond_with Player.where(club_id: params[:club_id])
  end
end
