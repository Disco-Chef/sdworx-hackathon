class CreateChosenVisions < ActiveRecord::Migration[6.0]
  def change
    create_table :chosen_visions do |t|
      t.string :motto
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
