class ChangeTapDateToDatetime < ActiveRecord::Migration
  def up
  	add_column :taps, :tapped_time, :datetime
  	remove_column :taps, :date
  end

  def down
	remove_column :taps, :tapped_time
	add_column :taps, :date, :date
  end
end
