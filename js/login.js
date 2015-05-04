$(document).ready(function(){
	$('.form').find('input, textarea').on('keyup blur focus', function(e) {
	  var $this = $(this),
		label = $this.prev('label');
	  if (e.type === 'keyup') {
		if ($this.val() === '') {
		  label.removeClass('active highlight');
		} else {
		  label.addClass('active highlight');
		}
	  } else if (e.type === 'blur') {
		if ($this.val() === '') {
		  label.removeClass('active highlight');
		} else {
		  label.removeClass('highlight');
		}
	  } else if (e.type === 'focus') {

		if ($this.val() === '') {
		  label.removeClass('highlight');
		} else if ($this.val() !== '') {
		  label.addClass('highlight');
		}
	  }
	});

	$('.tab a').on('click', function(e) {
	  e.preventDefault();
	  $(this).parent().addClass('active');
	  $(this).parent().siblings().removeClass('active');
	  target = $(this).attr('href');
	  $('.tab-content > div').not(target).hide();
	  $(target).fadeIn(600);
	});
	
	$('#register_button').click(function(){
		var userObject = new Object();
		var firstname = $('#register_firstname').val();
		userObject.firstname = firstname;
		var lastname = $('#register_lastname').val();
		userObject.lastname = lastname;
		var emailid = $('#register_emailid').val();
		userObject.emailid = emailid;
		var password = $('#register_password').val();
		userObject.password = password;
		console.log(userObject);
		var jsonString = JSON.stringify(userObject);
		$.ajax({
			type: 'POST',			
			data: 'jsonString='+jsonString,	
			url: 'php/register.php',			
			success: function(data) {			
				console.log(data);
				window.location.replace("login.html");
			}
		});
	});
	
	$('#login_button').click(function(){
		var userObject = new Object();		
		var emailid = $('#login_emailid').val();
		userObject.emailid = emailid;
		var password = $('#login_password').val();
		userObject.password = password;
		console.log(userObject);
		var jsonString = JSON.stringify(userObject);
		$.ajax({
			type: 'POST',			
			data: 'jsonString='+jsonString,	
			url: 'php/login.php',			
			success: function(JSONObject) {			
				console.log(JSONObject);	
				if(JSONObject.status == "Error"){
					$('#loginStatus').html(JSONObject['reason']);
				}else{
					window.location.replace("dashboard.html");
				}
			}
		});
	});
});