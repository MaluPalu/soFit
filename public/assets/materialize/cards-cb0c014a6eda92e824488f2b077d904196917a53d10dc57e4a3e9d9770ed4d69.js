!function(e){e(document).on("ready turbolinks:load",function(){e(document).on("click.card",".card",function(a){if(e(this).find("> .card-reveal").length){var t=e(a.target).closest(".card");t.data("initialOverflow")===undefined&&t.data("initialOverflow",t.css("overflow")===undefined?"":t.css("overflow")),e(a.target).is(e(".card-reveal .card-title"))||e(a.target).is(e(".card-reveal .card-title i"))?e(this).find(".card-reveal").velocity({translateY:0},{duration:225,queue:!1,easing:"easeInOutQuad",complete:function(){e(this).css({display:"none"}),t.css("overflow",t.data("initialOverflow"))}}):(e(a.target).is(e(".card .activator"))||e(a.target).is(e(".card .activator i")))&&(t.css("overflow","hidden"),e(this).find(".card-reveal").css({display:"block"}).velocity("stop",!1).velocity({translateY:"-100%"},{duration:300,queue:!1,easing:"easeInOutQuad"}))}})})}(jQuery);