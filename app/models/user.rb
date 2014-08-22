class User < ActiveRecord::Base
	has_many :recipes
	has_many :shopping_lists

	validates_uniqueness_of :name
  validates_presence_of :name
  validates_uniqueness_of :email
  validates_presence_of :email

  has_secure_password
end
