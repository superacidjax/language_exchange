class AddsAcceptTermsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :accepts_terms, :boolean
  end
end
