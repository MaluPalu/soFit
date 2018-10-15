class AddTargetWeightToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :target_weight, :string
  end
end
