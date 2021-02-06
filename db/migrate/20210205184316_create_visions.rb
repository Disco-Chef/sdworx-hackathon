class CreateVisions < ActiveRecord::Migration[6.0]
  def change
    create_table :visions do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
