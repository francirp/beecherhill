class ChangeEmployeeBudgetTable < ActiveRecord::Migration
  def change
    remove_column :employee_budgets, :emp_id
  end
end
