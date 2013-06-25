class AddNameOptionsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :full_name, :string
    add_column :employees, :first_initial_name, :string
    add_column :employees, :initials, :string
  end
end
