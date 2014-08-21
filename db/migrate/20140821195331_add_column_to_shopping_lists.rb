class AddColumnToShoppingLists < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :recipe_id, :integer
  end
end
