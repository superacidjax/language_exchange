class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name


  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  acts_as_birthday :birthday

  attr_accessible :birthday, :photo, :bio, :city, :country, :days_available,
                  :email, :facebook, :first_name, :gender, :imessage,
                  :lang_learning, :lang_spoken, :last_name, :msn, :skype,
                  :password, :password_confirmation, :languages_attributes,
                  :language_to_learns_attributes
  # serialize :lang_learning, :lang_spoken, :days_available

  has_many :languages
  accepts_nested_attributes_for :languages, reject_if: :all_blank,
                                allow_destroy: true

  has_many :language_to_learns
  accepts_nested_attributes_for :language_to_learns, reject_if: :all_blank,
                                allow_destroy: true

  mount_uploader :photo, PhotoUploader

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

end
