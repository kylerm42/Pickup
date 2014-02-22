class ChangeCreatorInEvent < ActiveRecord::Migration
  def change
    rename_column :events, :creator, :creator_id
    add_column :events, :address, :string
  end
end
