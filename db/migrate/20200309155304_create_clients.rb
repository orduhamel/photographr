class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :email
      t.boolean :tutoiement, default: false
      t.string :partner_name
      t.text :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
