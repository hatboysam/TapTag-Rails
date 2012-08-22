class CreateRedemptions < ActiveRecord::Migration
  def up
  	create_table :redemptions do |t|
  		t.integer :user_id
  		t.integer :company_id
  		t.integer :vendor_id
  		t.integer :reward_id
  		t.integer :taps
  		t.date	  :redeemed_date

  		t.timestamps
  	end
  end

  def down
  end
end
