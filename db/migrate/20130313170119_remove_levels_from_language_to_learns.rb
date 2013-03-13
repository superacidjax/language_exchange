class RemoveLevelsFromLanguageToLearns < ActiveRecord::Migration
  def up
    remove_column :language_to_learns, :speaking_level
    remove_column :language_to_learns, :reading_level
    remove_column :language_to_learns, :writing_level
    remove_column :languages, :speaking_level
    remove_column :languages, :reading_level
    remove_column :languages, :writing_level
  end

  def down
    add_column :language_to_learns, :writing_level, :integer
    add_column :language_to_learns, :reading_level, :integer
    add_column :language_to_learns, :speaking_level, :integer
    add_column :languages, :speaking_level
    add_column :languages, :reading_level
    add_column :languages, :writing_level
  end
end
