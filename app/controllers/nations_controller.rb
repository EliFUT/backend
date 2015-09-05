class NationsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Nation.all.order('name asc')
  end

  def show
    respond_with Nation.find(params[:id]), root: false
  end
end
