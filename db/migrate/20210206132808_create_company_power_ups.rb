class CreateCompanyPowerUps < ActiveRecord::Migration[6.0]
  def change
    create_table :company_power_ups do |t|
      t.string :name
      t.string :description
      t.references :company, null: false, foreign_key: true
      t.integer :xp

      t.timestamps
    end
  end
end
