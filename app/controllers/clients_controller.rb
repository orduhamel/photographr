class ClientsController < ApplicationController

  def index
    @clients = Client.where(user_id: current_user.id)
  end

  def show
    @client = current_user.clients.find(params[:id])
    @client.prestations = @client.prestations.order(start_date: :desc)
  end

end
