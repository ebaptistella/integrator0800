/**
 * Created by eurides on 26/04/16.
 */

$(document).ready(function() {
    $('body').serverStatus();
    
    $('#btn_task_import').click(function(){
        $('#frm_import').submit();
    })
    
    setInterval(function() { $.fn.serverStatus() }, 30000);
});
