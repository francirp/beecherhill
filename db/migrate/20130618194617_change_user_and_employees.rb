class ChangeUserAndEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :user_id
    add_column :users, :employee_id, :integer
  end
end
