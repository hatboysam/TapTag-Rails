class CreateOrders < ActiveRecord::Migration
  def up
  	create_table :orders do |t|
  		t.integer :company_id
  		t.integer :vendor_id
  		t.boolean :paid
  		t.boolean :completed

  		t.timestamps
  	end
  end

  def down
  	drop_table :orders
  end
end
