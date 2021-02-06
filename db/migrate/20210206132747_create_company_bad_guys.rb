class CreateCompanyBadGuys < ActiveRecord::Migration[6.0]
  def change
    create_table :company_bad_guys do |t|
      t.string :name
      t.string :story
      t.integer :xp
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
