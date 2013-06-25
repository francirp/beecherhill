class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :company_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :avatar
      t.string :title
      t.string :category
      t.integer :current_salary

      t.timestamps
    end
  end
end
