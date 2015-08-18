class LeaguesController < ApplicationController
  respond_to :json

  def show
    respond_with League.find(params[:id])
  end
end
