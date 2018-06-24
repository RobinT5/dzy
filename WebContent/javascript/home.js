    $(function() {
        $(".part4 img").mouseenter(function() {
            $(this).css("border", "1px solid gray");
            $(this).css("opacity", "0.6");
            $(this).parent().find("p").css("display", "block");
        });
        $(".part4 img").mouseleave(function() {
            $(this).css("opacity", "1");
            $(this).css("border", "1px solid white");
            $(this).parent().find("p").css("display", "none");
        });
        $("p").mouseenter(function() {
            $(this).show();
            $(this).siblings().css("opacity", "0.6");
            $(this).siblings().css("border", "1px solid gray");
        });

        $("ul").mouseenter(function() {
            $(this).children().show(100);
        });
        $("ul").mouseleave(function() {
            $(".items").hide();
        });

        $("li").mouseenter(function() {
            $(this).css("background-color", "white");
            $(this).children().css("color", "red");
        });
        $("li").mouseleave(function() {
            $(this).css("background-color", "#061019");
            $(this).children().css("color", "white");
        });



        $(".top").css("background-color", "#061019");
        $(".items").hide();
    });