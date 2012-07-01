class AddPasswordToCompanies < ActiveRecord::Migration
  def up
  	add_column :companies, :password_digest, :string
  end

  def down
  	remove_column :companies, :password_digest
  end
end
