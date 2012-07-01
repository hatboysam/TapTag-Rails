class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :company_id
      t.string :category
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
