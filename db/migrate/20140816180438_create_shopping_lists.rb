class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.integer :name_id
      t.text :content

      t.timestamps
    end
  end
end
