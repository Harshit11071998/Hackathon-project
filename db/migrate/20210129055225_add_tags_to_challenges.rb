class AddTagsToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :tags, :string
  end
end
