class AddUniqueIndexToRelationships < ActiveRecord::Migration[7.0]
  def change
    add_index :relationships, [:follower_id, :following_id], unique: true
  end
end
