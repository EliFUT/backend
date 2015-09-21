class LeaguesController < ApplicationController
  respond_to :json

  def show
    respond_with League.find(params[:id]), root: false
  end

  def index
    respond_with League.all
  end
end
