/**
 * Created by eurides on 25/04/16.
 */

(function ($) {

    $.fn.serverStatus = function () {
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: 'service/status',
            success: function (data) {
                if (!data.statusServidor) {
                    if (!$('#content').length) {
                        $('body').prepend('<div id="content"></div>');
                    }

                    if (!$('#content').find('#flash_error').length) {
                        $('#content').prepend('<div class="flash warning" id="flash_error"></div>');
                    }

                    $('#flash_error').html('<span>Serviço offline</span>');
                }
            }
        });
    };

}(jQuery));