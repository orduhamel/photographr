class PrestationsController < ApplicationController

  def index
    @prestations = current_user.prestations
    @tasks = @prestations.tasks
    # Parmi toutes les tasks de la prestation, afficher la start-time de la task dont kind = evenement
    @task = Task.joins(:prestation).where(kind: 'évènement')
  end

end
