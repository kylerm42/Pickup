class AddPeopleNeededToEvents < ActiveRecord::Migration
  def change
    add_column :events, :people_needed, :integer, :null => false
  end
end
