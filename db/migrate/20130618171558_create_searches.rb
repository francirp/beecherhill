class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :reference_num
      t.integer :client_id
      t.boolean :new_client?
      t.string :title
      t.string :function
      t.string :level
      t.date :search_start_date
      t.date :engagement_letter_signed_date
      t.string :be_lead
      t.string :source
      t.string :introduction
      t.integer :salary
      t.float :target_bonus_percent
      t.float :fee_percent
      t.string :status
      t.string :reason_closed
      t.text :notes
      t.string :name_of_hire
      t.date :signed_offer_date
      t.date :placement_start_date
      t.integer :signing_bonus
      t.string :equity
      t.string :network
      t.string :introduced_by
      t.string :relocation_from
      t.string :relocation_to
      t.string :diversity
      t.string :gender

      t.timestamps
    end
  end
end
