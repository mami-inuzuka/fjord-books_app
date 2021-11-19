class ChangeColumnsAndNotNullOnRelationships < ActiveRecord::Migration[6.1]
  def change
    change_column_null :relationships, :following_id, false, 0
    change_column_null :relationships, :follower_id, false, 0
  end
end
