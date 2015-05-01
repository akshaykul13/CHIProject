$(document).ready(function(){
	
	var fetchedQuestions;
	//Global Functionality
	$('#questionHolder').hide();
	
    $('#submit').click(function(){
        console.log('click');
        var major = $('#major').val();
        var company = $('#company').val();        
        var domain = $('#domain').val();
        var field = $('#field').val();  
        $.ajax({
            type : 'GET',
            url : 'php/question.php',
			dataType: "json",
			success: function(data) {							
				console.log(data);
				fetchedQuestions = data;
				populateQuestionHolder(data[0]);				
            } 
        });              
    });
	
	function populateQuestionHolder(object){
		console.log(object.title);		
		$('#problemTitle').html('<p>' + object.title + '</p>');				
		$('#question').html('<p>' + object.question + '</p>');
		$('#inputFormat').html('<p>' + object.input_format + '</p>');
		$('#constraints').html('<p>' + object.constraints + '</p>');
		$('#outputFormat').html('<p>' + object.output_format + '</p>');
		$('#questionHolder').show();
		var myCodeMirror = CodeMirror(document.getElementById('codeMirrorHolder'), {
		  value: "#include <iostream>\nint main()\n{\n\n}",
		  mode:  "clike",
		  lineWrapping: true, lineNumbers: true
		});
	}
});