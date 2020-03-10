class RenameStartTimeIntoStartDate < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :start_time, :date
    rename_column :tasks, :start_time, :start_date

    change_column :tasks, :end_time, :date
    rename_column :tasks, :end_time, :end_date

    rename_column :prestations, :start_time, :start_date
    rename_column :prestations, :end_time, :end_date
  end
end
