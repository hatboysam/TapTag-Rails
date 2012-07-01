class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.date :joined
      t.string :facebook
      t.string :email

      t.timestamps
    end
  end
end
