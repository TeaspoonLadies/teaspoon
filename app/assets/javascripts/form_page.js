$(function(){
	$('.grocery_wrapper').hide();
	// $('#recipe_converter_form #convert_button').on("click", function(e) {
	// 	console.log("button clicked");
	// 	alert("clicked");
	// 	e.preventDefault();
		$('#recipe_converter_form #convert_button').on("submit", function(e) {
			e.preventDefault();
			});
	

	$('#shopping_list_button').on("click", function(e) {
		e.preventDefault();
		$('.grocery_wrapper').slideDown();
		$(".grocery_list").append(ShoppingList)
		$(".grocery_list en-note:nth-child(3n)" ).remove();
		$(".grocery_list en-note:nth-child(2)" ).remove();
		// console.log("button clicked");
		// alert("clicked");

	});

	function ShoppingList(){
		var name = $("#name_field").val()
		var ingredients = $("#ingredient_area").val()
		var formList = ingredients.replace(/\n/g, '</li><li><en-todo checked="false"/>')
		var addLiBeginning = ('<li class="first_li"><en-todo checked="false"/>') + formList
		var addName = "<en-note><h1 id='recipe_name'>"+name+"</h1><ul id='recipe_list'>" + addLiBeginning
		var createList= addName + "</ul><button id='export_button'> Export Recipe</button></en-note>"
		return createList
	}	


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