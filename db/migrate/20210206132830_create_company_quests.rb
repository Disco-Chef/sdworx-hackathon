class CreateCompanyQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :company_quests do |t|
      t.string :name
      t.string :description
      t.integer :xp
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
