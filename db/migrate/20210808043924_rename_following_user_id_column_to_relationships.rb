class RenameFollowingUserIdColumnToRelationships < ActiveRecord::Migration[6.1]
  def change
    rename_column :relationships, :following_user_id, :following_id
    rename_column :relationships, :followed_user_id, :follower_id
  end
end
