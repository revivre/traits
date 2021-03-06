// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require best_in_place
//= require best_in_place.jquery-ui
//= require bootstrap
//= require_tree .
//= require moment
//= require moment/ja.js
//= require bootstrap-datetimepicker
$(function () {
  $('#datetimepicker_start').datetimepicker({
      locale: 'ja',
      format: 'hh:mm',
      defaultDate: new Date(gon.default_start_time)
  });

  $('#datetimepicker_end').datetimepicker({
      locale: 'ja',
      format: 'HH:mm',
      defaultDate: new Date(gon.default_end_time)
  });

  var paramDate = decodeURIComponent(location.search.match(/date=(.*?)(&|$)/)[1]);
  $('#datetimepicker_date').datetimepicker({
      locale: 'ja',
      format: 'YYYY/MM/DD',
      defaultDate: paramDate
  });

  $(".alert-success").fadeTo(2000, 0).slideUp(500, function() {
    $(this).remove();
  });
});
