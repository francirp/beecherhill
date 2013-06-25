class AddPercentRevGeneratingToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :percent_revenue_generating, :float
    add_column :employees, :factor_goal, :float
    add_column :employees, :start_month, :integer
    add_column :employees, :days_off, :integer
    add_column :employees, :hours_per_day, :float
    remove_column :employee_budgets, :annual_hours
    remove_column :employee_budgets, :revenue_generating_wages
    remove_column :employee_budgets, :factor_goal
    remove_column :employee_budgets, :days_off
    remove_column :employee_budgets, :start_month
    remove_column :employee_budgets, :hours_per_day
  end
end
