class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :action
      t.date :start_date
      t.date :end_date
      t.boolean :time_sensitive
      t.integer :actions_needed
      t.boolean :repeats

      t.timestamps
    end
  end
end
