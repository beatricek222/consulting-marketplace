class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.text :description
      t.integer :time_id
      t.integer :role_id
      t.string :company_name
      t.string :full_name

      t.timestamps
    end
  end
end
