class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.date :year
      t.integer :total_expenses
      t.integer :revenue_generating_wages
      t.float :target_profit_percent

      t.timestamps
    end
  end
end
