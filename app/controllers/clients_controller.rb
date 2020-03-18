class ClientsController < ApplicationController

  def index
    @clients = Client.where(user_id: current_user.id)
  end

  def show
    @client = current_user.clients.find(params[:id])
    # prestations = @client.prestations.order("prestation.start_date")
  end

end
