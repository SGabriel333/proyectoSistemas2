// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require twitter/bootstrap
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require adminlte

//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require select2.full.js
//= require select2.js
//= require jspdf.js
//= require jquery.dataTables.min.js
//= require dataTables.bootstrap.min.js



$(document).ready(function() {
    $(".input").keyup(function() {
      $('#submit').attr('disabled', false);
        var form = $(this).parents("#form");
        var check = checkCampos(form);
        if(check) {
            $('#submit').attr('disabled', false);
        }
        else {
            $('#submit').attr('disabled', true);
        }
    });
});
function checkCampos(obj) {
    var camposRellenados = true;
    obj.find(".input1").each(function() {
    var $this = $(this);
            if( $this.val().length <= 0 ) {
                camposRellenados = false;
                return false;
            }
    });
    if(camposRellenados == false) {
        return false;
    }
    else {
        return true;
    }
}
