class RemoveColumnsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :title
    remove_column :users, :category
    remove_column :users, :current_salary
  end
end
