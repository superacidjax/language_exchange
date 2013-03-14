class DropMyLists < ActiveRecord::Migration
  def up
    drop_table :my_lists
  end

  def down
    create_table :my_lists
  end
end
