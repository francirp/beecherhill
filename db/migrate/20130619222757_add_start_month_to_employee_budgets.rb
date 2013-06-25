class AddStartMonthToEmployeeBudgets < ActiveRecord::Migration
  def change
    add_column :employee_budgets, :start_month, :integer
    add_column :employee_budgets, :days_off, :integer
    add_column :employee_budgets, :hours_per_day, :integer
  end
end
