class CreateEmployeeBudgets < ActiveRecord::Migration
  def change
    create_table :employee_budgets do |t|
      t.integer :emp_id
      t.integer :budget_id
      t.integer :base_salary
      t.float :factor_goal
      t.integer :annual_salary_paid
      t.integer :projected_revenue
      t.integer :annual_hours
      t.integer :percent_revenue_generating
      t.integer :revenue_generating_wages

      t.timestamps
    end
  end
end
