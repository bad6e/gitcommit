$(document).ready(function(){
  $(".button1").click(function(){
      var $target = $('.commits'),
          $toggle = $(this);

          console.log($target)
      $target.slideToggle( 500, function () {
          $toggle.text(($target.is(':visible') ? 'Hide' : 'See') + ' Statistics');
      });
  });
});


