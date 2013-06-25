class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :state
      t.string :ownership
      t.string :revenue
      t.string :employees
      t.string :industry

      t.timestamps
    end
  end
end
