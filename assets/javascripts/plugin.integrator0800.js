/**
 * Created by eurides on 25/04/16.
 */

(function ($) {

    $.fn.serverStatus = function () {
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: 'serviceStatus',
            success: function (data) {
                if ((!data) || (!data.statusServidor)) {
                    $.fn.statusError();
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $.fn.statusError();
            }
        });
    };

    $.fn.statusError = function (message) {
        message = typeof message !== 'undefined' ? message : 'Serviço offline';

        if (!$('#content').length) {
            $('body').prepend('<div id="content"></div>');
        }

        if (!$('#content').find('#flash_error').length) {
            $('#content').prepend('<div class="flash warning" id="flash_error"></div>');
        }

        $('#flash_error').html('<span>' + message + '</span>');
    };

    $.fn.taskRedmineExists = function () {
        var el = $(this);
        var chamado_nro = $('#chamado_nro').val();

        if (chamado_nro > 0) {
            $.ajax({
                type: 'GET',
                dataType: 'json',
                url: 'taskRedmineExists/' + chamado_nro,
                success: function (data) {
                    el.removeAttr("disabled");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    el.attr("disabled", true);
                }
            });
        } else {
            el.attr("disabled", true);
        }

    };

}(jQuery));