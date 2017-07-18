class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.references :project,index:true, foreign_key: true

      t.timestamps null:false
    end
  end
end
