// Menu
$('#menu .nav li,.allcate .nav li')
    .on('mouseenter',function () {
        $(this).addClass('open').siblings().removeClass('open');
    }).on('mouseleave',function () {
        $(this).removeClass('open');
    });


$('#allcate:not(".home-hover")')
    .on('mouseenter',function () {
        $(this).addClass('hover').find('.allcate-title span').css('transform','rotate(180deg)');

    })
    .on('mouseleave',function () {
        $(this).removeClass('hover').find('.allcate-title span').css('transform','rotate(0deg)');
    });