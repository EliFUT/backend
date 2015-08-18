class NationsController < ApplicationController
  respond_to :json

  def show
    respond_with Nation.find(params[:id])
  end
end
