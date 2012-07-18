class AddCompanyIdToRewards < ActiveRecord::Migration
  def change
  	add_column :rewards, :company_id, :integer
  end
end
