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
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datepicker
//= require adminlte.min
//= require turbolinks
//= require_tree .


function readURL(input) {
  var validFileExtension = ['jpg', 'JPG', 'jpeg', 'JPEG', 'png', 'PNG', 'gif', 'GIF', 'bmp', 'BMP'];
  if ($.inArray($(input).val().split('.').pop().toLowerCase(), validFileExtension) == -1) {
    swal("Sorry !!! Allowed image formats are '.jpeg','.jpg', '.png', '.gif', '.bmp'");
  }else{

    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#profile-image img')
        .attr('src', e.target.result)
      };
      reader.readAsDataURL(input.files[0]);
      $("#upload-text").remove();
      $("#upload_button").parent(".profile-img-container").after("<div class='h4 white-text text-center' id='upload-text'>Got it! Click update to save image</div>");
    }
  }
}
