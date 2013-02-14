class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email

  acts_as_birthday :birthday

  attr_accessible :birthday, :bio, :city, :country, :days_available, :email, :facebook, :first_name, :gender, :imessage, :lang_learning, :lang_spoken, :last_name, :msn, :skype, :password, :password_confirmation
  # serialize :lang_learning, :lang_spoken, :days_available
end
