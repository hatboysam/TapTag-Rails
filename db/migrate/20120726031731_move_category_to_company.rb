class MoveCategoryToCompany < ActiveRecord::Migration
  def up
  	add_column :companies, :category, :string
  	remove_column :vendors, :category
  end

  def down
  	remove_column :companies, :category
  	add_column :vendors, :category, :string
  end
end
