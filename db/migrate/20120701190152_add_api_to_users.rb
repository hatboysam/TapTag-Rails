class AddApiToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :api, :string
  	remove_column :users, :joined
  end
end
