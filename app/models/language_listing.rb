class LanguageListing < ActiveRecord::Base
  attr_accessible :code, :language, :name
  belongs_to :language
  belongs_to :language_to_learn
end
