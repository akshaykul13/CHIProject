$(document).ready(function(){
	var questionCounter = 0;
        var numberofquestions = 0;
	var MCQ = 1;
	var CODING = 2;
	var alreadyDisplayedQuestions = [];
	var current_question = null;                
	
	window.onload = function (){
		$('#questionArea').hide();
		$('#infoArea').show();
		$('#questionNumber').hide();
		$('#questionText').hide();
		$('#completionArea').hide();
		$('#next_link').hide();
		$('#submit_link').show();
		$('#codingQuestionHolder').hide();
		$('#progress_bar').css("width", "0%");
	}
	
	$("#start_button").click(function(){
		//$('#infoArea').hide();
		//$('#next_link').show();
		//$('#submit_link').hide();
		//$('#questionNumber').show();
		        
		getNextQuestion();
	 });		
         
	 function getNextQuestion(){		               
        var question_type = $('#question_type').val();
		if(question_type == "MCQ"){
			question_type = 1;
		}else{
			question_type = 2;
		}		
		var company = $('#company_preference').val();	
		var field = $("#field_preferences").val();		
		var domain = $("#domain_preferences").val();		
		var difficulty = $("#difficulty").val();
	                
		var questionObject = new Object();
		questionObject.difficulty = difficulty;
		questionObject.company = company;
		questionObject.field = field;
		questionObject.question_type = question_type;
		questionObject.domain = domain;
		questionObject.alreadyDisplayedQuestions = alreadyDisplayedQuestions;
		var jsonString = JSON.stringify(questionObject);		
		console.log("Fetching Question : ");
		console.log(questionObject);
		$.ajax({
			type : 'GET',
			url : 'php/question.php',	
			data: 'jsonString='+jsonString,
			success: function(data) {
                console.log(data);	
				current_question = JSON.parse(data);
				if(current_question != null){
					if(current_question.type == MCQ){
						$('#questionText').show();		
						$('#codingQuestionHolder').hide();
						$('#submit_link').show();
						populateMCQ(current_question);						
					}else{
						$('#questionText').hide();		
						$('#codingQuestionHolder').show();
						$('#submit_link').hide();
						populateCoding(current_question);
					}
					alreadyDisplayedQuestions.push(current_question.id);					
					questionCounter++;
					$('#questionArea').show();
					$('#next_link').show();					
				}	
			} ,
			error: function(data){
				console.log(data);
			}
		});   		
	}
	
	$('#next_link').click(function(){		
		getNextQuestion();
	});
	
	$('#submit_link').click(function(){
		evaluateCurrentQuestion();
	});
	
	$('#finish_button').click(function(){
		window.location.replace("dashboard.html");
	});
	
	function evaluateCurrentQuestion(){
		if(current_question.type == 1){
			console.log("Evaluating MCQ");
			console.log($('#q'+(questionCounter)+'d').is(':checked'));
			if($('#q'+(questionCounter)+'a').is(':checked')){
				console.log($('#q'+(questionCounter)+'a').val() + ":" + current_question.output_format);
				if($('#q'+(questionCounter)+'a').val() == current_question.output){
					console.log("Correct Answer");
					$('#questionText').append('<p class="text-success">Correct Answer.</p>')
				}else{
					$('#questionText').append('<p class="text-danger">Incorrect Answer. The correct answer is '+current_question.output+'</p>')
					
				}
			}else if($('#q'+(questionCounter)+'b').is(':checked')){
				console.log($('#q'+(questionCounter)+'b').val());
				if($('#q'+(questionCounter)+'b').val() == current_question.output){
					console.log("Correct Answer");
					$('#questionText').append('<p class="text-success">Correct Answer.</p>')
				}
			}else if($('#q'+(questionCounter)+'c').is(':checked')){
				console.log($('#q'+(questionCounter)+'c').val());
				if($('#q'+(questionCounter)+'c').val() == current_question.output){
					console.log("Correct Answer");
					$('#questionText').append('<p class="text-success">Correct Answer.</p>')
				}
			}else if($('#q'+(questionCounter)+'d').is(':checked')){
				console.log($('#q'+(questionCounter)+'d').val()+":"+current_question.output_format);
				if($('#q'+(questionCounter)+'d').val() == current_question.output_format){
					console.log("Correct Answer");
					$('#questionText').append('<p class="text-success">Correct Answer.</p>')
  				}
			}				
		}else{
			console.log("Evaluating Coding");
		}
	}
	
	function populateCoding(current_question){
		$('#questionNumber').html('<p class="text-info">Question '+ (questionCounter+1) +'</p>');
		$('#problemTitle').html('<p class="question">'+ current_question.title +'</p>');	
		$('#question').html('<p class="question">'+ current_question.question +'</p>');
		$('#inputFormat').html('<p class="question">'+ current_question.input_format +'</p>');
		$('#constraints').html('<p class="question">'+ current_question.constraints +'</p>');
		$('#outputFormat').html('<p class="question">'+ current_question.output_format +'</p>');		
	}
	
	function populateMCQ(current_question){
		$('#questionNumber').html('<p class="text-info">Question '+ (questionCounter+1) +'</p>');
		$('#questionText').html('');
		$('#questionText').append('<p class="question">'+ current_question.question +'</p>');
		$('#questionText').append('<ul class="answers">'+
		'<input type="radio" name="q'+(questionCounter+1)+'" value="'+current_question.input_format+'" id="q'+(questionCounter+1)+'a"><label for="q'+(questionCounter+1)+'a">'+ current_question.input_format+'</label><br/>'+
		'<input type="radio" name="q'+(questionCounter+1)+'" value="'+current_question.constraints+'" id="q'+(questionCounter+1)+'b"><label for="q'+(questionCounter+1)+'b">'+ current_question.constraints+'</label><br/>'+
		'<input type="radio" name="q'+(questionCounter+1)+'" value="'+current_question.output_format+'" id="q'+(questionCounter+1)+'c"><label for="q'+(questionCounter+1)+'c">'+ current_question.output_format+'</label><br/>'+
		'<input type="radio" name="q'+(questionCounter+1)+'" value="'+current_question.input+'" id="q'+(questionCounter+1)+'d"><label for="q'+(questionCounter+1)+'d">'+ current_question.input+'</label><br/></ul>');
		$('#progress_bar').css("width", ((questionCounter+1)*10)+"%");
	}
	
	$('#code').submit( function(){
        var data = $(this).serialize();
        var source = $('textarea#source').val();
        
        if( source == '' ) {
            alert( 'No source code provided in the area.');
            return false;
        }
        
        $(this).append('<div class="loading">Processing...</div>');
        
		console.log("Before ajax: "+data);
        $.ajax({
            type: 'post',
            url: 'php/process.php',
            dataType: 'json',
            data: data + '&process=1',
            cache: false,
            success: function(response){				
                $('.loading').remove();
                $('.cmpinfo').remove();
                $('#response').show();
                if( response.status == 'success' ) {
					console.log(response);	
                    $('.meta').text( response.meta );
                    $('.output').html('<strong>Output</strong>: <br><br><pre>' + response.output + '</pre>');
					console.log(response.output);
					console.log(current_question.output_test_case);
					if(response.output == current_question.output){	
						console.log("Correct coding answer");
						competency_score = competency_score + current_coding_difficulty*20;
						current_coding_difficulty++;
					}else{
						
					}                
                    if( response.cmpinfo ) {
                        $('.cmpinfo').remove();
                        $('.meta').after('<div class="cmpinfo"></div>');
                        $('.cmpinfo').html('<strong>Compiler Info: </strong> <br><br>' + response.cmpinfo );
                    }
                    
                } else {
                    //$('.output').html('<pre>' + response + '</pre>');
                    alert( response.output );
                }
                //alert( response.msg );
            }
        });
        
        return false;
    });
});

