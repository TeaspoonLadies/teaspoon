$(function(){
	$('#recipe_converter_form #convert_button').on("click", function(e) {
		console.log("button clicked");
		alert("clicked");
		e.preventDefault();
		$('#recipe_converter_form #convert_button').on("submit", function(e) {
			e.preventDefault();
			});
	});

	$('#shopping_list_button').on("click", function(e) {
		var ingredients = $("#ingredient_area").val()
		// var newIngredients = ('<li><en-todo checked="false"/>')+ingredients+('</li>')
		var newIngredients = ingredients.replace(/\n/g, '</li><li><en-todo checked="false"/>')
		var updatedIngredients = ('<li><en-todo checked="false"/>') + newIngredients
		// "<li>".concat(newIngredients)
		e.preventDefault();
		$(".hello").append(updatedIngredients)
		console.log("button clicked");
		alert("clicked");


		});


		// text = self.recipe.ingredients
  //   name = self.recipe.name
  //   text.gsub!("\r\n", '</li><li><en-todo checked="false"/>')
  //   text.slice!(0..4)
  //   text << "</li>"
  //   text.insert(0, "<en-note><h1>#{name}</h1><ul>")
  //   text << "</ul></en-note>"
  //   self.content = text


// $(document).ready(function(){

// 	$("#shopping_list_button").hide();

// });

// 	$(document).on('#convert_button', '#recipe_converter_form', function(e) {
// 		$("#ingredients").text("Converted Ingredients");
// 		$("#shopping_list_button").show();
// 		$.ajax({
// 			type: 'GET',
// 			url: $(this).attr('action'),
// 			type: $(this).attr('method'),
// 			data: $(this).serialize(),
// 			success: function(html) {
// 				alert('ok');
// 				console.log('ok');
// 			}
// 		});
// 		e.preventDefault();
// 	});
});

	// $(".close_friends_list").on("click", ".edit-friend-button", function(e){
 //    e.preventDefault();
 //    $(this).parent().find(".edit_friend_form").first().css("visibility", "visible").slideToggle();
 //  });