class RemoveCompanyUsername < ActiveRecord::Migration
  def up
  	remove_column :companies, :username
  end

  def down
  	add_column :companies, :username, :string
  end
end
