class RemoveLevelFromLanguages < ActiveRecord::Migration
  def up
    remove_column :languages, :level
  end

  def down
    add_column :languages, :level, :integer
  end
end
