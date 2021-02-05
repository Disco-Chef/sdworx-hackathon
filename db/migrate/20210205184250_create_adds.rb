class CreateAdds < ActiveRecord::Migration[6.0]
  def change
    create_table :adds do |t|
      t.string :strategy
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
