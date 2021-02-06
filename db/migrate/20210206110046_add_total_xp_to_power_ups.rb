class AddTotalXpToPowerUps < ActiveRecord::Migration[6.0]
  def change
    add_column :power_ups, :total_xp, :integer
  end
end
