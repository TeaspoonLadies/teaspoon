class ShoppingList < ActiveRecord::Base
  # belongs_to :user
  belongs_to :recipe
  before_save :grocery_list

  def grocery_list
    text = self.recipe.ingredients
    name = self.recipe.name
    text.gsub!("\r\n", '</li><li><en-todo checked="false"/>')
    text.slice!(0..4)
    text << "</li>"
    text.insert(0, "<en-note><h1>#{name}</h1><ul>")
    text << "</ul></en-note>"
    self.content = text
  end
  
end
