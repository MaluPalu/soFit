class AddCurrentBmiToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_bmi, :string
  end
end
