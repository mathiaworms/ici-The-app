class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :alias
      t.datetime :birthday
      t.integer :age_range
      t.boolean :is_admin?, default: false
      t.timestamps
    end
  end
end
