class TasksController < ApplicationController
  def index
    tasks = Task.joins(prestation: :client).where(clients: { user_id: current_user.id })
    today = DateTime.current.beginning_of_day

    # Afficher toutes les Tasks par order chronologique des 7 prochains jours, dont kind = 'admin' ou 'créa'
    @todo = tasks.
      where(kind: ['admin', 'créa']).
      where('tasks.start_time BETWEEN ? AND ?', today, (today + 7.days)).
      order("tasks.start_time")

    # Afficher les 6 prochains Tasks dont kind = 'évènement'
    @evenement = tasks.
      where(kind: 'évènement').
      where('tasks.start_time >= ?', today).
      order("tasks.start_time").
      first(6)

    # Afficher les 3 prochains Tasks dont kind = 'rendez-vous'
    @rdv = tasks.
      where(kind: 'rendez-vous').
      where('tasks.start_time >= ?', today).
      order("tasks.start_time").
      first(3)
  end
end
