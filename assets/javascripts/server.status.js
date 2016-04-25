/**
 * Created by eurides on 25/04/16.
 */

$(document).ready(
    $.fn.serverStatus = function () {

        $.get("integrator0800/server/status", function (data) {
            $(".content").add(data);
            alert("Load was performed.");
        });

    }
);