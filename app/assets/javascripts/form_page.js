$(function(){
	$('#grocery_wrapper').hide();
	$('#shopping_list_button').hide();

	$('#recipe_converter_form #convert_button').on("click", function() {	
		$('#ingredients').text("Converted Recipe")
		$('#shopping_list_button').show()
	});

	$('#shopping_list_button').on("click", function(e) {
		e.preventDefault();
		$('#grocery_wrapper').slideDown();
		$("#grocery_list").append(ShoppingList());
	});

	function ShoppingList(){
		var name = $("#name_field").val();
		var ingredients = $("#ingredient_area").val();
		var formList = ingredients.replace(/\n/g, '</li><li><en-todo checked="false"/>');
		var addLiBeginning = ('<li class="first_li"><en-todo checked="false"/>') + formList;
		var addName = "<en-note><h1 id='recipe_name'>"+name+"</h1><ul id='recipe_list'>" + addLiBeginning;
		var createList= addName + "</ul><button id='export_button'> Export Recipe</button></en-note>";
		return createList;
	}	

});

