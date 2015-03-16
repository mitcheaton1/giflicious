
  
$(document).ready(ready)
$(document).on('page:load', ready)

   $(function() {
        $(".rumble").hover(
          function() {
            $(this).attr("src", $(this).data('motion-src'));
            },
          function() {
            $(this).attr("src", $(this).data('static-src'));
            }                         
        );
      });

    $(function(){  
        $(".rumble").jrumble({
          speed: 120
        });
        $(".rumble").hover(function(){
          $(this).trigger('startRumble');
        }, function(){
          $(this).trigger('stopRumble');
        });
      });
    });
});

    