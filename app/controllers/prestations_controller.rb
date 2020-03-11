class PrestationsController < ApplicationController

  def index
    @prestations = current_user.prestations
  end

  def show
    @prestation = current_user.prestations.find(params[:id])
  end

  def new
    @prestation = Prestation.new
  end

  def create
    @prestation = Prestation.new(prestation_params)
    if @prestation.category == 'Entreprise'
      @prestation.title = "#{@prestation.category} #{@prestation.client.company_name}"
    else
      @prestation.title = "#{@prestation.category} #{@prestation.client.last_name}"
    end

    if @prestation.save
      redirect_to prestation_path(@prestation)
    else
      render :new
    end
  end

  private

  def prestation_params
    params.require(:prestation).permit(:category, :location, :notes, :start_date, :end_date, :client_id)
  end
end
