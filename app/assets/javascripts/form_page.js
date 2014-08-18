$(function(){
	// $('#recipe_converter_form input[type=submit]').on("click", function(e) {
	$('#recipe_converter_form #convert_button').on("click", function(e) {
		console.log("button clicked");
		alert("clicked");
		e.preventDefault();
		// $("#results #text_area").text(Recipe.conversion(:content));
		 $("#results #text_area").text(@recipe);
		// $("#results").change(function(e) {
		// 	$("#text_area").text(Recipe.conversion(string));
		// });
	});
	

	$(document).on('#convert_button', '#recipe_converter_form', function(e) {
		$.ajax({
			type: 'GET',
			url: $(this).attr('action'),
			type: $(this).attr('method'),
			data: $(this).serialize(),
			success: function(html) {
				alert('ok');
				console.log('ok');
			}
		});
		e.preventDefault();
	});
});

	// $(".close_friends_list").on("click", ".edit-friend-button", function(e){
 //    e.preventDefault();
 //    $(this).parent().find(".edit_friend_form").first().css("visibility", "visible").slideToggle();
 //  });