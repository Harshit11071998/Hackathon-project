class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.text :tags
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
