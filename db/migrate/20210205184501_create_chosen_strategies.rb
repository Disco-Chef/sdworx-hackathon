class CreateChosenStrategies < ActiveRecord::Migration[6.0]
  def change
    create_table :chosen_strategies do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :strategy, null: false, foreign_key: true
      t.string :personal_strategic_goal

      t.timestamps
    end
  end
end
