$('#recipe_converter_form').submit(function() {
	console.log("button clicked");
	alert("hi");
	$("#results").change(function(e) {
		$("#results").text(Recipe.conversion(string));
	});
});

$(document).on('#submit_button', '#recipe_converter_form', function(e) {
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