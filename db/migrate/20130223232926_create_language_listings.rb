class CreateLanguageListings < ActiveRecord::Migration
  def change
    create_table :language_listings do |t|
      t.string :name
      t.string :code
      t.string :language

      t.timestamps
    end
  end
end
