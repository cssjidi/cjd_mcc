$(function(){
    $('#menu .nav li').on('mouseover',function () {
        $(this).addClass('open').siblings().removeClass('open');
    });

    $('#menu .nav li').on('mouseout',function () {
        $(this).removeClass('open');
    });


    $('#allcate:not(".home-hover")')
        .on('mouseenter',function () {
            $(this).addClass('hover').find('.allcate-title span').css('transform','rotate(180deg)');
            console.log(1234)
        })
        .on('mouseleave',function () {
            $(this).removeClass('hover').find('.allcate-title span').css('transform','rotate(0deg)');
        });
})


