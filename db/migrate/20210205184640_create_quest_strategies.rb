class CreateQuestStrategies < ActiveRecord::Migration[6.0]
  def change
    create_table :quest_strategies do |t|
      t.references :quest, null: false, foreign_key: true
      t.references :chosen_strategy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
