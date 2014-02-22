class ChangeUsers < ActiveRecord::Migration
  def change

    rename_column :users, :aouth_token, :oauth_token
  end
end
