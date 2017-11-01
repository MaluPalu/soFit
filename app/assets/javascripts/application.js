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
//= require rails-ujs
//= require TimeSpan-1.2
//= require jquery
//= require turbolinks
//= require moment
//= require inputmask
//= require inputmask.date.extensions
//= require materialize-sprockets
//= require highcharts
//= require chartkick
//= require_tree .

document.addEventListener("turbolinks:load", function() {
    var divs = $('div[id^="quote-"]').hide(),
      i = 0;

      (function cycle() {

      divs.eq(i).fadeIn(400)
                .delay(7000)
                .fadeOut(400, cycle);

      i = ++i % divs.length;

    })();
    $('select').material_select();
    $(".button-collapse").sideNav();
    $('.dropdown-button').dropdown({
     inDuration: 300,
     outDuration: 225,
     constrainWidth: false, // Does not change width of dropdown to that of the activator
     hover: true, // Activate on hover
     gutter: 0, // Spacing from edge
     belowOrigin: true, // Displays dropdown below the button
     alignment: 'left', // Displays dropdown with edge aligned to the left of button
     stopPropagation: false // Stops event propagation
   });
   var milli = $('.milliTime');
   var im = new Inputmask('datetime', {
     mask: "99:99:99.999",
     placeholder: "hh:mm:ss.MMM"
   });
   im.mask(milli);
   $('.new_goal').on("submit", function(e){
     var timeString = $('.milliTime');
     var newTime = moment.duration(timeString.val()).asMilliseconds();
     $('.hiddenTime').val(newTime)
   });
   $('.new_tracking').on("submit", function(e){
     var timeString = $('.milliTime');
     var newTime = moment.duration(timeString.val()).asMilliseconds();
     $('.hiddenTime').val(newTime)
   });
   var chart = Chartkick.charts["chart-1"];
   chart.setOptions({
     colors: ["cyan"],
     library:{
       chart: {
         backgroundColor: "transparent"
       },
       xAxis: {
         type: 'datetime', max: chart.getOptions().library.xAxis.max
       },
        yAxis: {
          min: goalTime,
           labels: {
              formatter: function(){
                // setting dummy date to trick moment into treating our duration like a date so we can format correctly
                return moment('2000-01-01 00:00:00').add(moment.duration(this.value)).format('HH:mm:ss.SSS');
            }
          }
        }
      }
    });
  });
  $('icon-class').on('click', 'turbolinks:load');
