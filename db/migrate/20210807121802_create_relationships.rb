class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :following_user_id
      t.integer :followed_user_id

      t.timestamps
    end
  end
end
