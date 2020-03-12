class ChangeDefaultStatusInPrestation < ActiveRecord::Migration[5.2]
  def change
    change_column_default :prestations, :status, from: 'En cours', to: 'progress'
  end
end
