class User < ActiveRecord::Base
  attr_accessible :age, :bio, :city, :country, :days_available, :email, :facebook, :first_name, :gender, :imessage, :lang_learning, :lang_spoken, :last_name, :msn, :skype
end
