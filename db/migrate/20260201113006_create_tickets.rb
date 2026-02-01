class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :priority
      t.string :created_by

      t.timestamps
    end
  end
end
