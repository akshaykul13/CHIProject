$(document).ready(function(){
	var questionCounter = 0;
	var MCQ = "mcq";
	var CODING = "coding";
        var questions = [{
				"question_type" :   "mcq",
				"question"		: 	"Q1: Who came up with theory of relativity?",
				"choices"		: 	[
										"Sir Isaac Newton",
										"Nicolaus Copernicus",
										"Albert Einstein",
										"Ralph Waldo Emmerson"
									],
				"correct"		: 	"Albert Einstein",
				"explanation"	: 	"Albert Einstein drafted the special theory of relativity in 1905.",
 
			},
			{
				"question_type" :   "mcq",
				"question"		: 	"Q2: Who is on the two dollar bill?",
				"choices"		: 	[
										"Thomas Jefferson",
										"Dwight D. Eisenhower",
										"Benjamin Franklin",
										"Abraham Lincoln"
									],
				"correct"		: 	"Thomas Jefferson",
				"explanation"	: 	"The two dollar bill is seldom seen in circulation. As a result, some businesses are confused when presented with the note.",
			},
			{
				"question_type" :   "coding",
				"question"		: 	"Print all numbers which do not begin with 42.",
				"input"			: 	"456%0D%0A423",
				"correct"		: 	"456",				
			}];
	
	window.onload = function ()
        {
		$('#infoArea').show();
		$('#questionNumber').hide();
		$('#questionText').hide();
		$('#next_link').hide();
		$('#codingQuestionHolder').hide();
		$('#progress_bar').css("width", "0%");
	}
	
	$("#start_button").click(
                function(){
		$('#infoArea').hide();
		$('#next_link').show();
		$('#questionNumber').show();
                $.ajax({
                    type : 'GET',
                    url : 'php/competency.php',
        	
        			success: function(data) {							
        				console.log(data);
        				//fetchedQuestions = data;
        				//populateQuestionHolder(data);				
                                } ,
                                error: function(data){
                                        console.log(data);
                                }
                        });              
                 });
		var current_question = questions[questionCounter];		
		if(current_question.question_type == MCQ){
			$('#questionText').show();		
			$('#codingQuestionHolder').hide();
			populateMCQ(current_question);						
		}
                else{
			$('#questionText').hide();		
			$('#codingQuestionHolder').show();
			populateCoding(current_question);
		}
		questionCounter++;
	
	$('#next_link').click(function(){
		var current_question = questions[questionCounter];		
		if(current_question.question_type == MCQ){
			$('#questionText').show();		
			$('#codingQuestionHolder').hide();
			populateMCQ(current_question);
		}else{
			$('#questionText').hide();		
			$('#codingQuestionHolder').show();
			populateCoding(current_question);
		}
		questionCounter++;
	});
	
	function populateCoding(current_question){
		$('#questionNumber').html('<p class="text-info">Question '+ (questionCounter+1) +'</p>');
		$('#problemTitle').html('<p class="question">'+ current_question.question +'</p>');	
		$('#question').html('<p class="question">'+ current_question.question +'</p>');
		$('#inputFormat').html('<p class="question">'+ current_question.question +'</p>');
		$('#constraints').html('<p class="question">'+ current_question.question +'</p>');
		$('#outputFormat').html('<p class="question">'+ current_question.question +'</p>');
		var myCodeMirror = CodeMirror(document.getElementById('codeMirrorHolder'), {
		  value: "function myScript(){return 100;}\n",
		  mode:  "javascript",
		  lineWrapping: true, lineNumbers: true
		});
	}
	
	function populateMCQ(current_question){
		$('#questionNumber').html('<p class="text-info">Question '+ (questionCounter+1) +'</p>');
		$('#questionText').html('');
		$('#questionText').append('<p class="question">'+ current_question.question +'</p>');
		$('#questionText').append('<ul class="answers">'+
		'<input type="radio" name="q'+(questionCounter+1)+'" value="a" id="q'+(questionCounter+1)+'a"><label for="q'+(questionCounter+1)+'a">'+ current_question.choices[0]+'</label><br/>'+
		'<input type="radio" name="q'+(questionCounter+1)+'" value="b" id="q'+(questionCounter+1)+'b"><label for="q'+(questionCounter+1)+'b">'+ current_question.choices[1]+'</label><br/>'+
		'<input type="radio" name="q'+(questionCounter+1)+'" value="c" id="q'+(questionCounter+1)+'c"><label for="q'+(questionCounter+1)+'c">'+ current_question.choices[2]+'</label><br/>'+
		'<input type="radio" name="q'+(questionCounter+1)+'" value="d" id="q'+(questionCounter+1)+'d"><label for="q'+(questionCounter+1)+'d">'+ current_question.choices[3]+'</label><br/></ul>');
		$('#progress_bar').css("width", ((questionCounter+1)*10)+"%");
	}
});