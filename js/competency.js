$(document).ready(function(){
	var questionCounter = 0;
	var MCQ = 1;
	var CODING = 2;
	var alreadyDisplayedQuestions = [];
	var current_mcq_difficulty = 1;
	var current_coding_difficulty = 1;
	var questionOrder = [MCQ, MCQ, CODING, MCQ, MCQ, MCQ, CODING, MCQ, MCQ, CODING];
	var current_question = null;
	var competency_score = 0;	
	
	window.onload = function (){
		$('#infoArea').show();
		$('#questionNumber').hide();
		$('#questionText').hide();
		$('#completionArea').hide();
		$('#next_link').hide();
		$('#submit_link').hide();
		$('#codingQuestionHolder').hide();
		$('#progress_bar').css("width", "0%");
	}
	
	$("#start_button").click(function(){
		$('#infoArea').hide();
		$('#next_link').show();
		$('#submit_link').show();
		$('#questionNumber').show();
		
		getNextQuestion();
	 });		
	 
	 function getNextQuestion(){
		var object = new Object();
		$.ajax({
			type : 'GET',
			url : 'php/fetchpreferences.php',	
			success: function(data) 
            {				
				console.log(data);
				object.field = JSON.parse(data).field;
			} ,
            async : false,
			error: function(data)
                        {
				console.log(data);
			}
		});		
		object.alreadyDisplayedQuestions = alreadyDisplayedQuestions;
		object.question_type = questionOrder[questionCounter];
		if(questionOrder[questionCounter] == MCQ){
			object.difficulty = current_mcq_difficulty;
		}else{
			object.difficulty = current_coding_difficulty;
		}	
		console.log("Fetching Question : ");
		console.log(object);
		var jsonString = JSON.stringify(object);
		$.ajax({
			type : 'GET',
			url : 'php/competency.php',	
			data: 'jsonString='+jsonString,
			success: function(data) {											
				current_question = JSON.parse(data);
				if(current_question != null){
					if(current_question.type == MCQ){
						$('#questionText').show();		
						$('#codingQuestionHolder').hide();
						populateMCQ(current_question);						
					}else{
						$('#questionText').hide();		
						$('#codingQuestionHolder').show();
						populateCoding(current_question);
					}
					alreadyDisplayedQuestions.push(current_question.id);					
					questionCounter++;
				}				
			} ,
			error: function(data){
				console.log(data);
			}
		});   
		if(questionCounter >= 9){
			$('#next_link').hide();
			$('#submit_link').show();
		}
	}
	
	$('#next_link').click(function(){
		evaluateCurrentQuestion();
		getNextQuestion();
	});
	
	$('#submit_link').click(function(){
		var object = new Object();
		object.competency_score = competency_score;
		var jsonString = JSON.stringify(object);
		$.ajax({
			type : 'POST',
			url : 'php/savecompetencyscore.php',	
			data: 'jsonString='+jsonString,
			success: function(data) {											
				console.log(data);
				console.log(JSON.parse(data));
				var row = JSON.parse(data);
				$('#completed_field').html("Field: " + row.field_preference);
				$('#completed_domain').html("Domain: " + row.domain_preference);
				$('#completed_time').html("Submission Time: " + row.time);
				$('#completed_score').html("Competency Score: " + competency_score);
				$('#infoArea').hide();
				$('#questionNumber').hide();
				$('#questionText').hide();
				$('#codingQuestionHolder').hide();
				$('#completionArea').show();
			} 
		});
	});
	
	$('#finish_button').click(function(){
		window.location.replace("dashboard.html");
	});
	
	function evaluateCurrentQuestion(){
		if(questionOrder[questionCounter-1] == MCQ){
			console.log("Evaluating MCQ");
			console.log($('#q'+(questionCounter)+'d').is(':checked'));
			if($('#q'+(questionCounter)+'a').is(':checked')){
				console.log($('#q'+(questionCounter)+'a').val() + ":" + current_question.output_format);
				if($('#q'+(questionCounter)+'a').val() == current_question.output){
					console.log("Correct Answer");
					competency_score = competency_score + current_mcq_difficulty*10;
					if(current_mcq_difficulty < 5)
						current_mcq_difficulty++;
				}
			}else if($('#q'+(questionCounter)+'b').is(':checked')){
				console.log($('#q'+(questionCounter)+'b').val());
				if($('#q'+(questionCounter)+'b').val() == current_question.output){
					console.log("Correct Answer");
					competency_score = competency_score + current_mcq_difficulty*10;
					if(current_mcq_difficulty < 5)
						current_mcq_difficulty++;
				}
			}else if($('#q'+(questionCounter)+'c').is(':checked')){
				console.log($('#q'+(questionCounter)+'c').val());
				if($('#q'+(questionCounter)+'c').val() == current_question.output){
					console.log("Correct Answer");
					competency_score = competency_score + current_mcq_difficulty*10;
					if(current_mcq_difficulty < 5)
						current_mcq_difficulty++;
				}
			}else if($('#q'+(questionCounter)+'d').is(':checked')){
				console.log($('#q'+(questionCounter)+'d').val()+":"+current_question.output_format);
				if($('#q'+(questionCounter)+'d').val() == current_question.output_format){
					console.log("Correct Answer");
					competency_score = competency_score + current_mcq_difficulty*10;
					if(current_mcq_difficulty < 5)
						current_mcq_difficulty++;
				}
			}else{
				competency_score = competency_score;
			}				
			console.log("Competency Score: " + competency_score);
		}else{
			console.log("Evaluating Coding");
		}
	}
	
	function populateCoding(current_question){
		$('#questionNumber').html('<p class="text-info">Question '+ (questionCounter+1) +'</p>');
		$('#problemTitle').html('<p class="coding_question">'+ current_question.title +'</p>');	
		$('#question').html('<p class="coding_question">'+ current_question.question +'</p>');
		$('#inputFormat').html('<p class="coding_question">'+ current_question.input_format +'</p>');
		$('#constraints').html('<p class="coding_question">'+ current_question.constraints +'</p>');
		$('#outputFormat').html('<p class="coding_question">'+ current_question.output_format +'</p>');		
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
					//console.log(current_question.output_test_case);					
					competency_score = competency_score + current_coding_difficulty*20;
					current_coding_difficulty++;
					                
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