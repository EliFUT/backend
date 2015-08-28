class NationsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Nation.all
  end
end
