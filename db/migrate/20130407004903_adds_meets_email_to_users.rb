class AddsMeetsEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :meets_email, :boolean
  end
end
