$(document).ready(function(){
    $('#submit').click(function(){
        console.log('click');
        var major = $('#major').val();
        var company = $('#company').val();        
        var domain = $('#domain').val();
        var field = $('#field').val();  
        $.ajax({
            type : 'GET',
            url : 'php/question.php',
			success: function(data) {							
				console.log(data);
                $.each( data, function( key, value ) {
                    $('#statement').append(value);
                });
            } 
        });              
    }); 
});