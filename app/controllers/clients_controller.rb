class ClientsController < ApplicationController

  def index
    @clients = Client.where(user_id: current_user.id)
    # @rdvs = Client.where(user_id: current_user.id).prestations.tasks.where(kind: 'rendez-vous')
  end

  def show
    @client = current_user.clients.find(params[:id])
  end

end
