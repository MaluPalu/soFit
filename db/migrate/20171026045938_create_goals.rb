class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.bigint :category_id
      t.string :name
      t.integer :time
      t.string :unit_of_measurement
      t.integer :distance
      t.datetime :deadline

      t.timestamps
    end
  end
end
