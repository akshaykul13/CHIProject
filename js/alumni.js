$(document).ready(function(){

window.onload = function (){
		console.log("inside ajax");	
		$.ajax({
			type: 'GET',
			url: 'php/getalumni.php',
			data: { company_name: 'Apple'},
			success: function(data) {							
				console.log(data);
			}
		});
	}
});