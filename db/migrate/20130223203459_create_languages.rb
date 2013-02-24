class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.integer :speaking_level
      t.integer :reading_level
      t.integer :writing_level
      t.integer :user_id

      t.timestamps
    end
  end
end
