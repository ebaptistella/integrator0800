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
                if ((!data) || (!data.statusServidor)) {
                    $.fn.statusError();
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $.fn.statusError();
            }
        });
    };

    $.fn.statusError = function () {
        if (!$('#content').length) {
            $('body').prepend('<div id="content"></div>');
        }

        if (!$('#content').find('#flash_error').length) {
            $('#content').prepend('<div class="flash warning" id="flash_error"></div>');
        }

        $('#flash_error').html('<span>Serviço offline</span>');
    };

    $.fn.taskRedmineExists = function() {
        var el = $(this);
        var chamado_nro = $('#chamado_nro').val();

        if (chamado_nro > 0) {
            $.ajax({
                type: 'GET',
                dataType: 'json',
                url: 'consult/task_redmine_exists/' + chamado_nro,
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