class AddMeetsSkypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :meets_skype, :boolean
    add_column :users, :meets_facebook, :boolean
    add_column :users, :meets_msn, :boolean
  end
end
