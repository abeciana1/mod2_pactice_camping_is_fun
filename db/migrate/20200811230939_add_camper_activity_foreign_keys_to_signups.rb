class AddCamperActivityForeignKeysToSignups < ActiveRecord::Migration[6.0]
  def change
    add_column :signups, :camper_id, :integer
    add_column :signups, :activity_id, :integer
  end
end
