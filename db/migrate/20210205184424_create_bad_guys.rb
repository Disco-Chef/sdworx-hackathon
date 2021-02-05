class CreateBadGuys < ActiveRecord::Migration[6.0]
  def change
    create_table :bad_guys do |t|
      t.string :name
      t.string :story
      t.integer :xp
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
