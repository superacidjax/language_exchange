class AddDeletedToMyLists < ActiveRecord::Migration
  def change
    add_column :my_lists, :deleted, :boolean
  end
end
