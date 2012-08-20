class AddTappedDateToTaps < ActiveRecord::Migration
  def change
  	add_column :taps, :tapped_date, :date
  end
end
