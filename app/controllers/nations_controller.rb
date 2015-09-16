class NationsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Nation.where(id: League.where('nation_id is not null').pluck(:nation_id))
  end

  def show
    respond_with Nation.find(params[:id]), root: false
  end
end
