$(document).ready(function(){
	$(".chosen-select-deselect").chosen()
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
                var loc, desc = "";
		console.log("inside ajax");	
		$.ajax({
			type : 'GET',
			url : 'php/fetchpreferences.php',	
			success: function(data) 
                        {
                                
                                console.log(data);
                                loc = JSON.parse(data).location;
                                if(JSON.parse(data).company)
                                        desc += JSON.parse(data).company + " ";
                                if(JSON.parse(data).keywords)
                                        desc += JSON.parse(data).keywords + " ";
                                if(JSON.parse(data).domain)
                                        desc += JSON.parse(data).domain + " ";
                                if(JSON.parse(data).field)
                                        desc += JSON.parse(data).field + " ";
                                //console.log(loc);			
			} ,
                        async : false,
			error: function(data)
                        {
				console.log(data);
			}
		});
                //console.log(loc);
                //console.log(desc);
                $.ajax({
			type: 'GET',
			dataType: 'jsonp',
			data: { description: desc, location: loc},
			url: 'http://jobs.github.com/positions.json?',
			beforeSend: function(){				
				ajaxindicatorstart('Loading Data.. Please Wait..');
			},
			complete: function(){
				ajaxindicatorstop();
			},
			success: function(data) {			
				//console.log(data.length);
				for( var i=0; i<data.length; i++) //Object obj in data)
				{
					var obj = data[i];
					var time2 = obj.created_at.replace(" UTC","");
					time2 = time2.substring(4);
					var clock = time2.substring(7,15);
					var year = time2.substring(time2.length-4);
					time2 = time2.substring(0,6)+" "+year+" "+clock;
					$('#joblist tbody').append('<tr><td>'+time2+'</td><td>'+obj.company+'</td><td>'+obj.title+'</td><td>'+obj.location+'</td><td><a>Link</a></td><td><div class="arrow"></div></td></tr><tr class="tableRowInfo"><td colspan="6"><div style="width:100%;"><img src="'+obj.company_logo+'"alt="Company Logo" height="60" style="padding-top:10px;"/><a href="'+obj.company_url+'" style="padding-left:5em;text-decoration:underline;">Company URL</a><a href="'+obj.url+'" style="padding-left:5em;text-decoration:underline;">Job URL</a><h4>Job Description</h4>'+obj.description+'How to apply: 	'+obj.how_to_apply+'</div></td></tr>');
					//console.log(data[i]);
					//console.log(obj.created_at.type);
				}
				$("tbody tr:even").addClass("even");								
				$("tbody tr:not(.even)").hide();
				$("tbody tr:first-child").show();				
				$("tbody tr.even").click(function(){
					$(this).next("tr").toggle();
					$(this).find(".arrow").toggleClass("up");
				});
			}
		});				
	}
	
	$("#logout_link").click(function(){
		$.ajax({
			type: 'GET',						
			url: 'php/logout.php',			
			success: function(JSONObject) {			
				console.log(JSONObject);					
				window.location.replace("login.html");				
			}
		});
	});		
	var config = {
			  '.chosen-select'           : {},
			  '.chosen-select-deselect'  : {allow_single_deselect:true},
			  '.chosen-select-no-single' : {disable_search_threshold:10},
			  '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
			  '.chosen-select-width'     : {width:"95%"}
	}
			
	//"document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block
	$('#preferences_link').click(function(){
		$('#light').css('display', 'block');
		$('#fade').css('display', 'block');				
		for (var selector in config) {
			$(selector).chosen(config[selector]);
		}
		$.ajax({
			type: 'GET',						
			url: 'php/fetchpreferences.php',			
			success: function(JSONObject) {			
				console.log(JSONObject);
				console.log(JSON.parse(JSONObject));
				var object = JSON.parse(JSONObject);
				console.log(object.location);				
				$('#display_location').html(object.location);
				$('#display_company').html(object.company);
				$('#display_keywords').html(object.keywords);
				$('#display_field').html(object.field);
				$('#display_domain').html(object.domain);
			}
		});		
	});
});