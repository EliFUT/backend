class PlayersController < ApplicationController
  respond_to :json

  def show
    respond_with Player.find(params[:id])
  end
end
