class TasksController < ApplicationController
  def index
    tasks = Task.joins(prestation: :client).where(clients: { user_id: current_user.id })
    today = Date.today

    # Afficher toutes les Tasks par order chronologique des 7 prochains jours, dont kind = 'admin' ou 'créa'
    @todo = tasks.
      where(kind: ['admin', 'créa']).
      where('tasks.start_date BETWEEN ? AND ?', today, (today + 7.days)).
      order("tasks.start_date")

    @todo_by_day = @todo.group_by(&:start_date)

    # Afficher les 6 prochains Tasks dont kind = 'évènement'
    @evenement = tasks.
      where(kind: 'évènement').
      where('tasks.start_date >= ?', today).
      order("tasks.start_date").
      first(5)

    # Afficher les 3 prochains Tasks dont kind = 'rendez-vous'
    @rdv = tasks.
      where(kind: 'rendez-vous').
      where('tasks.start_date >= ?', today).
      order("tasks.start_date").
      first(3)
  end
end
