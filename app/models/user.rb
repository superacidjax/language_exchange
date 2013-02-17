class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  acts_as_birthday :birthday

  attr_accessible :birthday, :photo, :bio, :city, :country, :days_available,
                  :email, :facebook, :first_name, :gender, :imessage,
                  :lang_learning, :lang_spoken, :last_name, :msn, :skype,
                  :password, :password_confirmation
  # serialize :lang_learning, :lang_spoken, :days_available

  mount_uploader :photo, PhotoUploader
end
