class CreatePowerUpVisions < ActiveRecord::Migration[6.0]
  def change
    create_table :power_up_visions do |t|
      t.references :chosen_vision, null: false, foreign_key: true
      t.references :power_up, null: false, foreign_key: true

      t.timestamps
    end
  end
end
