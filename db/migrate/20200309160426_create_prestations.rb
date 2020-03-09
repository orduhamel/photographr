class CreatePrestations < ActiveRecord::Migration[5.2]
  def change
    create_table :prestations do |t|
      t.references :client, foreign_key: true
      t.string :title
      t.string :category
      t.string :location
      t.string :notes
      t.string :status, default: 'En cours'

      t.timestamps
    end
  end
end
