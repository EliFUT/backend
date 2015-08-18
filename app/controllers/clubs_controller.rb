class ClubsController < ApplicationController
  respond_to :json

  def show
    respond_with Club.find(params[:id])
  end
end
