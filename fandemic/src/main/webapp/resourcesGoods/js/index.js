/**
 * Created by weily on 06/17/2018.
 */
$(function () {
    $('.menu_go_item>a').on('click', function () {
        $('.breadcrumb a').eq(1).text($(this).find('h2').text()) //右边导航条展示的是当前点击的栏目
        $('.breadcrumb a').eq(2).text('').prev().hide()
        if ($(this).next().css('display') == "none") {
            $('.menu_go_item').children('ul').slideUp(300);
            $(this).next('ul').slideDown(300);
            $(this).parent('li').addClass('menu_go_show').siblings('li').removeClass('menu_go_show');
        } else {
            $(this).next('ul').slideUp(300);
            $('.menu_go_item.menu_go_show').removeClass('menu_go_show');
        }
    })
    $('.menu_go_item_child li').on('click', function () {
        $('.breadcrumb a').eq(2).text($(this).find('span').text())
        $('.split.last').show();
        var index = $(this).index();
        var Pindex = $(this).parent().parent().index();
        $('.menu_go_item_child li.check').removeClass('check')
        $(this).addClass('check').siblings().removeClass('check');
        $('.main_con_item').eq(Pindex).show().siblings().hide()
        $('.main_con_item').eq(Pindex).find('li').eq(index).show().siblings().hide()
    })
    !(function() {
        var h = window.innerHeight||document.body.clientHeight||document.documentElement.clientHeight;
        $('.main_wrapper,.main_con').css({'height':(h-110) + 'px' })
    })()
})