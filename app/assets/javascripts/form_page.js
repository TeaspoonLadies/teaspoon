// $("#submit_button").click(function(e) {
// 	console.log("button clicked");
// 	alert("hi");
// 	e.preventDefault();
// });



$(document).on('#submit_button', '#recipe_converter_form', function(e) {
	$.ajax({
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