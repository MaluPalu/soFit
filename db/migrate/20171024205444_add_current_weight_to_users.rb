class AddCurrentWeightToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_weight, :string
  end
end
