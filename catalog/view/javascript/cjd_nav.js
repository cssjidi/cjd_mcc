$(function(){
    $('#menu .nav li')
        .on('mouseenter',function () {
            $(this).addClass('open').siblings().removeClass('open');
        })
        .on('mouseleave',function () {
            $(this).removeClass('open');
        });
});


