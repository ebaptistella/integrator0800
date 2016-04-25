/**
 * Created by eurides on 25/04/16.
 */

$(document).ready(
    $.fn.serverStatus = function() {
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: 'integrator0800/service/status',
            //data : { json: JSON.stringify( task ) },
            success: function(data) {
                if (!$('#content').length) {
                    $('body').append('<div id="content">1#content</div>');
                }

                if (!$('#content > .alert').length) {
                    $('body > #content').append('<div class="alert alert-danger" role="alert">2#alert<ul></ul></div>');
                }
    
                $('body > #content > .alert > ul').html('<li>#'+new Date()+'</li>');
            }
        });
        
        setTimeout($(document).serverStatus(), 5000);
    };

    $(document).serverStatus();
);
