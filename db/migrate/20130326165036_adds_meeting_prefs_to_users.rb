class AddsMeetingPrefsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :meets_face_to_face, :boolean, default: false
    add_column :users, :meets_online, :boolean, default: false
    add_column :users, :meets_telephone, :boolean, default: false

    add_index :users, :meets_face_to_face
    add_index :users, :meets_online
    add_index :users, :meets_telephone

  end

end
