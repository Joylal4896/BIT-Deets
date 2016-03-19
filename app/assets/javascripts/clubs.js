$(document).ready(function(){
    $(".video-cover").hide();
    $("#ex-list").hide();

    $(".inside-subscribe").hide();
    

    $("#btn-1").click(function(){
        $("#ex-list").toggle(1500);
        $(".video-cover").hide();
    });
    $("#btn-2").click(function(){
        $(".video-cover").toggle(1500);
        $("#ex-list").hide();
    });
    $(".subscribe-button").click(function(){
        $(".inside-subscribe").toggle(500);
        
    });

    $("#pop").on("click", function() {
    $('#imagepreview').attr('src', $('#imageresource').attr('src')); 
    $('#imagemodal').modal('show'); 
    });

});

