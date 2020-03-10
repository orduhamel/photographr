class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :prestation, foreign_key: true
      t.string :name
      t.string :kind
      t.text :description
      t.boolean :urgent, default: false
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
