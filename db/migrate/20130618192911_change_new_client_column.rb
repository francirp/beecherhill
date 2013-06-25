class ChangeNewClientColumn < ActiveRecord::Migration
  def change
    remove_column :searches, :new_client?
    add_column :searches, :new_client, :boolean
  end
end
