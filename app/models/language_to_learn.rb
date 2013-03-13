class LanguageToLearn < ActiveRecord::Base
  attr_accessible :name, :level, :user_id
  belongs_to :user
end
