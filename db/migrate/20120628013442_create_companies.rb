class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
