class AddLevelToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :level, :integer
    add_column :language_to_learns, :level, :integer
  end
end
