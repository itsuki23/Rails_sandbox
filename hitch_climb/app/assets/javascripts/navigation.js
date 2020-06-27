
// jquery でナビゲーションのレスポンシブ対応

$(function(){

    $('#hamburger').click(function(){

        $(this).toggleClass("active");



        var Top = 0;
        if($('#menu').hasClass('open')) {
            $('#menu').removeClass('open');
            Top = -350;
        } else {
            $('#menu').addClass('open');
            Top = 0;
        }

        $('#menu').animate({
            top: Top
        }, 500);
    });
});

// 参考
// https://www.nxworld.net/tips/12-css-hamburger-menu-active-effect.html
// hamburgerはcssで対応