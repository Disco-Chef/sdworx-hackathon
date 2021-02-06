class AddTotalXpToBadGuys < ActiveRecord::Migration[6.0]
  def change
    add_column :bad_guys, :total_xp, :integer
  end
end
