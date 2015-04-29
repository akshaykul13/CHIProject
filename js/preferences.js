$(document).ready(function(){
	
	$('#save_preferences').click(function(){
		console.log('clicked');	
		var location = $('#location_preference').val();
		console.log(location);
		var company = $('#company_preference').val();
		console.log(company);
		var keywords = $("#keyword_preferences").val();
		console.log(keywords);
		var preferenceObject = new Object();
		preferenceObject.location = location;
		preferenceObject.company = company;
		preferenceObject.keywords = keywords;
		var jsonString = JSON.stringify(preferenceObject);
		$.ajax({
			type: 'POST',			
			data: 'jsonString='+jsonString,	
			url: 'php/savepreferences.php',			
			success: function(JSONObject) {			
				console.log(JSONObject);
				window.location.replace("dashboard.html");
			}
		});
	});
});