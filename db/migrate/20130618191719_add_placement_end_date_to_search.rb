class AddPlacementEndDateToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :placement_end_date, :date
  end
end
