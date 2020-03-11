class PrestationsController < ApplicationController

  def index
    @prestations = current_user.prestations
  end

  def show
    @prestation = current_user.prestations.find(params[:id])
  end

  # def create
  #   @prestation = Prestation.new(prestation_params)
  #   @prestation.client = Client.find(params[:id])
  # end

end
