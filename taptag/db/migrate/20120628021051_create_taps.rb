class CreateTaps < ActiveRecord::Migration
  def change
    create_table :taps do |t|
      t.integer :vendor_id
      t.integer :company_id
      t.integer :user_id
      t.date :date

      t.timestamps
    end
  end
end
