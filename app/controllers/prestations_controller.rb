class PrestationsController < ApplicationController

  def index
    @prestations = current_user.prestations
  end

  def show
    @prestation = Prestation.find(params[:id])
  end

  # def create
  #   @prestation = Prestation.new(prestation_params)
  #   @prestation.client = Client.find(params[:id])
  # end

end
