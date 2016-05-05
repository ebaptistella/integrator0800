/**
 * Created by eurides on 26/04/16.
 */

$(document).ready(function() {
    $('body').serverStatus();
    
    $('#btn_task_import').taskRedmineExists();
    
    setInterval(function() { $.fn.serverStatus() }, 30000);
});
