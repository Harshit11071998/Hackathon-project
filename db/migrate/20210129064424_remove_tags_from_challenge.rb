class RemoveTagsFromChallenge < ActiveRecord::Migration[5.1]
  def change
    remove_column :challenges, :tags, :string
  end
end
