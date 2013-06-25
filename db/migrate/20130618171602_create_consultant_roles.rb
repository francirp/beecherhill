class CreateConsultantRoles < ActiveRecord::Migration
  def change
    create_table :consultant_roles do |t|
      t.integer :employee_id
      t.integer :search_id
      t.string :type
      t.integer :budgeted_hours
      t.integer :actual_hours
      t.integer :actual_cost

      t.timestamps
    end
  end
end
