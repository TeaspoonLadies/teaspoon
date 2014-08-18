class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :recipes, :content, :ingredients
  end
end
