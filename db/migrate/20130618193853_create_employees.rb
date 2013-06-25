class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :title
      t.string :category
      t.integer :current_salary

      t.timestamps
    end
  end
end
