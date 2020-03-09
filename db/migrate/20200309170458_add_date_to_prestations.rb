class AddDateToPrestations < ActiveRecord::Migration[5.2]
  def change
    add_column :prestations, :start_time, :date
    add_column :prestations, :end_time, :date
  end
end
