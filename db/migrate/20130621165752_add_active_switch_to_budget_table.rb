class AddActiveSwitchToBudgetTable < ActiveRecord::Migration
  def change
    add_column :budgets, :is_active, :boolean
  end
end
