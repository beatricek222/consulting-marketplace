class CreateUserInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_interests do |t|
      t.integer :expertise_id
      t.integer :user_id

      t.timestamps
    end
  end
end
