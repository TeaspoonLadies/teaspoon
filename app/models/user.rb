class User < ActiveRecord::Base
	has_many :recipes
	has_many :shopping_lists

  def self.create_with_omniauth(auth_hash)
    # self.create(:provider = auth_hash["provider"], :name = auth_hash["info"]["name"], :uid = auth_hash["uid"])
    create! do |user|
      user.provider = auth_hash["provider"]
      user.uid = auth_hash["uid"]
      user.name = auth_hash["info"]["name"]
    end
  end
end
