class CreateTrackings < ActiveRecord::Migration[5.1]
  def change
    create_table :trackings do |t|
      t.bigint :goal_id
      t.integer :time
      t.string :unit_of_measurement
      t.integer :distance

      t.timestamps
    end
  end
end
