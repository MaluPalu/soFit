class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.bigint :user_id
      t.string :name


      t.timestamps
    end
    execute "ALTER TABLE categories add constraint user_exercise_type unique(user_id, name);"
  end
end
