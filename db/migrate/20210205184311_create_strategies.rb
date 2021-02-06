class CreateStrategies < ActiveRecord::Migration[6.0]
  def change
    create_table :strategies do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
