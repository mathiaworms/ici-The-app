class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :end_time
      t.string :title
      t.boolean :is_finish? , default: false
      t.text :description 
      t.float :longitude_pos
      t.float :latitude_pos
      t.integer :attendees_max
      t.references :host, index: true
      t.timestamps
    end
  end
end
