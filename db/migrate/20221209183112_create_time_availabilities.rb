class CreateTimeAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :time_availabilities do |t|
      t.string :description

      t.timestamps
    end
  end
end
