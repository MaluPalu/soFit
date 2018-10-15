class AddTargetBmiToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :target_bmi, :string
  end
end
