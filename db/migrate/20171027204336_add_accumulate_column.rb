class AddAccumulateColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :accumulate, :boolean
  end
end
