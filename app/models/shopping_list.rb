class ShoppingList < ActiveRecord::Base
  # belongs_to :user
  belongs_to :recipe

  def grocery_list
    text = self.recipe.ingredients
    binding.pry
    text.gsub!("\r\n", '</li><li><en-todo checked="false"/>')
    text.slice!(0..4)
    text << "</li>"
    text.insert(0, "<en-note><h1>#{recipe}</h1><ul>")
    text << "</ul></en-note>"
    binding.pry
    self.content = text
  end
end
