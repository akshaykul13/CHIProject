jQuery(document).ready(function($) {
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
