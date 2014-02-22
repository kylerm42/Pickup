class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :deets
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.integer :creator, null: false

      t.timestamps
    end

    add_index :events, :title
    add_index :events, :latitude
    add_index :events, :longitude
    add_index :events, :date
  end
end
