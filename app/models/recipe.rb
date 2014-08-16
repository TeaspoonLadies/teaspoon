class Recipe < ActiveRecord::Base

  has_one :shopping_list
end
