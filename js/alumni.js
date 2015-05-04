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
		var company = "";
		$.ajax({
			type: 'GET',						
			url: 'php/fetchpreferences.php',			
			async: false,
			beforeSend: function(){				
				ajaxindicatorstart('Loading Data.. Please Wait..');
			},
			complete: function(){
				ajaxindicatorstop();
			},
			success: function(JSONObject) {			
				console.log(JSONObject);
				console.log(JSON.parse(JSONObject));
				company = JSON.parse(JSONObject).company;
			}
		});
		console.log("inside ajax");	
		var object = new Object();
		object.company = company;
		var jsonString = JSON.stringify(object);
		$.ajax({
			type: 'GET',
			url: 'php/getalumni.php',
			data: 'jsonString='+jsonString,
			beforeSend: function(){				
				ajaxindicatorstart('Loading Data.. Please Wait..');
			},
			complete: function(){
				ajaxindicatorstop();
			},
			success: function(data) {							
				console.log(JSON.parse(data));
				for( var i=0; i<JSON.parse(data).length; i++) //Object obj in data)
				{					
					var obj = JSON.parse(data)[i];
					$('#alumniList tbody').append('<tr><td>'+obj.name+'</td><td>'+obj.company+'</td><td>'+obj.graduation_class+'</td><td>'+obj.major+'</td><td>'+obj.location+'</td></tr><tr class="tableRowInfo"><td colspan="4"><p class="alumniDetails">Company: '+obj.company+'</p><p class="alumniDetails">Company Domain: '+obj.company_domain+'</p><p class="alumniDetails">Degree: '+obj.degree+'</p><p class="alumniDetails">Designation: '+obj.designation+'</p><p class="alumniDetails">Email: '+obj.email+'</p><p class="alumniDetails">Major: '+obj.major+'</p><p class="alumniDetails">University: '+obj.university+'</p></td></tr>');
					//console.log(data[i]);
					//console.log(obj.created_at.type);
				}
				$("#alumniList tbody tr:even").addClass("even");								
				$("#alumniList tbody tr:not(.even)").hide();
				$("#alumniList tbody tr:first-child").show();				
				$("#alumniList tbody tr.even").click(function(){
					$(this).next("tr").toggle();
					$(this).find(".arrow").toggleClass("up");
				});
			}
		});
	}
});