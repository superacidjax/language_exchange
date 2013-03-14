class CreateMyLists < ActiveRecord::Migration
  def change
    create_table :my_lists do |t|
      t.integer :watched_user_id
      t.integer :user_id

      t.timestamps
    end
  end
end
