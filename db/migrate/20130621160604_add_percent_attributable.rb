class AddPercentAttributable < ActiveRecord::Migration
  def change
    add_column :consultant_roles, :percent_attributable, :float
  end
end
