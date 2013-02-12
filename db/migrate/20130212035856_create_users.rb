class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :city
      t.string :country
      t.string :lang_spoken
      t.string :lang_learning
      t.string :gender
      t.integer :age
      t.text :bio
      t.string :days_available
      t.string :imessage
      t.string :skype
      t.string :facebook
      t.string :msn
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      t.timestamps
    end
  end
end
