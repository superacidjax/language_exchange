class LanguageToLearn < ActiveRecord::Base
  attr_accessible :name, :reading_level, :speaking_level, :user_id, :writing_level
  belongs_to :user
end
