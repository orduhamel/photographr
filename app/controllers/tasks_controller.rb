class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update mark_as_urgent mark_as_done]

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

  def show; end

  def edit; end

  def update
    @task.update(task_params)

    if @task.save
      respond_to do |format|
        format.html { redirect_to task_path(@task) }
        format.js  # <-- will render `app/views/tasks/update.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js  # <-- idem
      end
    end
  end

  def mark_as_urgent
    if @task.urgent
      @task.update(urgent: false)
    else
      @task.update(urgent: true)
    end

    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js  # <-- will render `app/views/tasks/mark_as_done.js.erb`
    end
  end

  def mark_as_done
    if @task.done
      @task.update(done: false)
    else
      @task.update(done: true)
    end

    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js  # <-- will render `app/views/tasks/mark_as_done.js.erb`
    end
  end

  def calendar
    # Build all displayed dates range
    @today = Date.today

    month_start_date          = @today.beginning_of_month
    month_start_date_week_day = month_start_date.wday
    month_starts_on_sunday    = month_start_date_week_day == 0
    start_offset = month_starts_on_sunday ? 6 : month_start_date_week_day - 1
    calendar_start_day = month_start_date - start_offset.day
    month_end_date          = @today.end_of_month
    month_end_date_week_day = month_end_date.wday
    month_ends_on_sunday    = month_end_date_week_day == 0
    end_offset = month_ends_on_sunday ? 0 : 7 - month_end_date_week_day
    calendar_end_day = month_end_date + end_offset.day
    all_days_to_display_in_calendar_view = (calendar_start_day..calendar_end_day)

    @all_days = all_days_to_display_in_calendar_view.to_a

    @days_current_month = (month_start_date..month_end_date).to_a

    #@days_by_week = @all_days.first(7)
    # Load all tasks for current month
    @day_tasks = current_user.tasks.
      where('tasks.start_date BETWEEN ? AND ?', month_start_date, month_end_date).
      order("tasks.start_date ASC")

    @tasks_by_day = @day_tasks.group_by(&:start_date)
  end

  private

  def set_task
    tasks = Task.joins(prestation: :client).where(clients: { user_id: current_user.id })
    @task = tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :start_date, :end_date, :urgent, :done)
  end
end







