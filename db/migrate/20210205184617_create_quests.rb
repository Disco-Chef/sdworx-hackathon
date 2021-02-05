class CreateQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :quests do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.integer :completion_rate
      t.string :description
      t.integer :xp
      t.boolean :completed

      t.timestamps
    end
  end
end
