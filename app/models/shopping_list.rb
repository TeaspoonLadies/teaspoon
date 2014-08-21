require 'pry'
class ShoppingList < ActiveRecord::Base
  # belongs_to :user
  belongs_to :recipe

  def grocery_list
    self.recipe.ingredients = "carrot cake"
    text = "\r\n 1.0 pound tri-colored spiral pasta\r\n 1.59 ounces salad seasoning mix\r\n 0.99 pound Italian-style salad dressing\r\n 0.66 pound cherry tomatoes, diced\r\n 1 green bell pepper, chopped\r\n 1 red bell pepper, diced\r\n 0.5 yellow bell pepper, chopped\r\n 2.22 ounces black olives, chopped" 
    text.gsub!("\r\n", '</li><li><en-todo checked="false"/>')
    text.slice!(0..4)
    text << "</li>"
    text.insert(0, "<en-note><h1>#{recipe}</h1><ul>")
    text << "</ul></en-note>"
    self.content = text
  end
end

# <en-note>  
#   <h1>Recipe Title</h1>  
#   <ul>
#     <li><en-todo checked="false"/>1 cup carrots</li> 
#     <li><en-todo checked="false"/>1 tablespoon parsley</li>
#   </ul>
# </en-note>