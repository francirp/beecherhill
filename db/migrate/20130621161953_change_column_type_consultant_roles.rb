class ChangeColumnTypeConsultantRoles < ActiveRecord::Migration
  def change
    remove_column :consultant_roles, :type
    add_column :consultant_roles, :role, :string
  end
end
