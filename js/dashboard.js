$(document).ready(function(){
	
	function ajaxindicatorstart(text){
		if(jQuery('body').find('#resultLoading').attr('id') != 'resultLoading'){
		jQuery('body').append('<div id="resultLoading" style="display:none"><div><img src="images/ajax-loader.gif"><div>'+text+'</div></div><div class="bg"></div></div>');
		}
		
		jQuery('#resultLoading').css({
			'width':'100%',
			'height':'100%',
			'position':'fixed',
			'z-index':'10000000',
			'top':'0',
			'left':'0',
			'right':'0',
			'bottom':'0',
			'margin':'auto'
		});	
		
		jQuery('#resultLoading .bg').css({
			'background':'#000000',
			'opacity':'0.7',
			'width':'100%',
			'height':'100%',
			'position':'absolute',
			'top':'0'
		});
		
		jQuery('#resultLoading>div:first').css({
			'width': '250px',
			'height':'75px',
			'text-align': 'center',
			'position': 'fixed',
			'top':'0',
			'left':'0',
			'right':'0',
			'bottom':'0',
			'margin':'auto',
			'font-size':'16px',
			'z-index':'10',
			'color':'#ffffff'
			
		});

	    jQuery('#resultLoading .bg').height('100%');
        jQuery('#resultLoading').fadeIn(300);
	    jQuery('body').css('cursor', 'wait');
	}

	function ajaxindicatorstop(){
	    jQuery('#resultLoading .bg').height('100%');
        jQuery('#resultLoading').fadeOut(300);
	    jQuery('body').css('cursor', 'default');
	}

	window.onload = function (){
		console.log("inside ajax");	
		$.ajax({
			type: 'GET',
			dataType: 'jsonp',
			data: { description: 'python', location: 'New York'},
			url: 'http://jobs.github.com/positions.json?',
			beforeSend: function(){				
				ajaxindicatorstart('Loading Data.. Please Wait..');
			},
			complete: function(){
				ajaxindicatorstop();
			},
			success: function(data) {			
				console.log(data.length);
				for( var i=0; i<data.length; i++) //Object obj in data)
				{
					var obj = data[i];
					
					$('#joblist tr:last').after('<tr><td>'+obj.created_at+'</td><td>'+obj.company+'</td><td>'+obj.title+'</td><td>'+obj.location+'</td><td><a>Link</a></td></tr>');
					console.log(data[i]);
					console.log(obj.created_at.type);
				}
			}
		});
	}
});