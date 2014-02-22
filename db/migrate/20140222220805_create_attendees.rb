class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false

      t.timestamps
    end

    add_index :attendees, [:user_id, :event_id], unique: true
    add_index :attendees, :event_id
  end
end
