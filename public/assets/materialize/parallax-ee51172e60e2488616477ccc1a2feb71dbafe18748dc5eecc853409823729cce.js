!function(i){i.fn.parallax=function(){var n=i(window).width();return this.each(function(){function t(t){var h;h=n<601?o.height()>0?o.height():o.children("img").height():o.height()>0?o.height():500;var e=o.children("img").first(),r=e.height(),a=r-h,c=o.offset().top+h,d=o.offset().top,s=i(window).scrollTop(),l=window.innerHeight,w=s+l,f=(w-d)/(h+l),g=Math.round(a*f);t&&e.css("display","block"),c>s&&d<s+l&&e.css("transform","translate3D(-50%,"+g+"px, 0)")}var o=i(this);o.addClass("parallax"),o.children("img").one("load",function(){t(!0)}).each(function(){this.complete&&i(this).trigger("load")}),i(window).scroll(function(){n=i(window).width(),t(!1)}),i(window).resize(function(){n=i(window).width(),t(!1)})})}}(jQuery);