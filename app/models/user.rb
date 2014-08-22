class User < ActiveRecord::Base
	has_many :recipes
	has_many :shopping_lists

  def self.create_with_omniauth(auth_hash)
    # self.create(:provider = auth_hash["provider"], :name = auth_hash["info"]["name"], :uid = auth_hash["uid"])
    self.create(
      :provider => auth_hash["provider"],
      :uid => auth_hash["uid"],
      :name => auth_hash["info"]["name"]
    )
  end
end
