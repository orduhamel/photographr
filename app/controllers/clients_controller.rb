class ClientsController < ApplicationController

  def index
    @clients = Client.where(user_id: current_user.id)
  end

end
