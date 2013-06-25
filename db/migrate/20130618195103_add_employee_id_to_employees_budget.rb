class AddEmployeeIdToEmployeesBudget < ActiveRecord::Migration
  def change
    add_column :employee_budgets, :employee_id, :integer
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :email, :string
  end
end
