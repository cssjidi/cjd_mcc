<?php echo $header; ?>

<div class="container" style="display: none;">
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#tab_category" aria-controls="tab_category" role="tab" data-toggle="tab"><?php echo $text_category; ?></a></li>
        <li role="presentation"><a href="<?php echo $brands; ?>" aria-controls="tab_brand" role="tab" ><?php echo $text_brands; ?></a></li>
    </ul>
</div>

<div class="container list">
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="tab_category">

            <?php if($categories){ ?>
            <div class="categories">
                <div id="allSortTab">
                    <div class="clearfix" style="display: block;">
                        <?php foreach($categories as $index=>$cate){ ?>
                        <a class="ui-category-item <?php if($index == 0){echo 'selected';} ?>" href="#" data-idx="<?php echo $index+1; ?>" data-idx="0"><?php echo $cate['name']; ?></a>
                        <?php } ?>
                    </div>
                </div>
            </div>

            <div class="category-items row">
                <?php foreach($categories as $index=>$category){ ?>
                <div class="col-xs-12 col-sm-6 col-lg-6" data-idx="<?php echo $index+1; ?>">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="item-title">
                                <b class="fa fa-th-large text-info"></b>
                                <span><?php echo $category['name']; ?></span>
                            </h2>
                        </div>
                        <div class="panel-body">
                            <div class="items">
                                <?php if($category['children']){ ?>
                                <?php foreach($category['children'] as $level2){ ?>
                                <dl class="clearfix">
                                    <dt><a href="<?php echo $level2['href']; ?>target="_blank"><?php echo $level2['name']; ?></a></dt>
                                    <?php if($level2['children']){ ?>
                                    <dd>
                                        <?php foreach($level2['children'] as $level3){ ?>
                                        <a href="<?php echo $level3['href']; ?>" target="_blank"><?php echo $level3['name']; ?></a>
                                        <?php } ?>
                                    </dd>
                                    <?php } ?>
                                </dl>
                                <?php } ?>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
            <?php } ?>

        </div>

    </div>


</div>

<?php echo $footer; ?>

<script>
    (function ($) {
        var lastScrollTop = 0,
             scrollDir='',
             topMargin=0,
             contentParts=[],
             itemActive='';

        $(window).scroll(function () {
            var st = $(this).scrollTop();
            if (st > lastScrollTop){
                scrollDir = 'down';
            } else {
                scrollDir = 'up';
            }
            lastScrollTop = st;
        });
        $.fn.cjdFixUp = function (options) {
            if(options != null){
                options.itemData
            }
            //this.options.scrollDir = scrollDir;
            var _this = $(this);
            $(document).on('scroll',function () {
                var scrollTop = parseInt($(this).scrollTop());
                if(scrollDir == 'down'){
                    _this.addClass('fix-categories');
                }
                if(scrollDir == 'up'){
                    console.log('up'+scrollTop);
                    _this.removeClass('fix-categories');
                }
            })
        }
        /*
        var api;
        api = cjdMenuScroll = {
            options : {
                lastScrollTop:0,
                scrollDir:'sdf',
                topMargin:0,
                itemActive:'',
            },
            init:function () {
                console.log(this.options.scrollDir,this.options.topMargin,this.options.itemActive);
            }
        };


        $(document).on('scroll', function() {
            //api.options.scrollDir
        });
        */
        /*
        var myTop = $('.categories').offset().top - $('.categories').height();
        $('#allSortTab a').on('click',function (e) {
            e.preventDefault();
            $('.categories').height($('#allSortTab').height());
            var idx = $(this).data('idx');
            var selector = '[data-idx='+idx+']';
            var offset = $(selector,'.category-items').offset().top - $('#allSortTab').height() - 20;
            $('body').animate({'scrollTop':offset},500);
            $(this).addClass('selected').siblings().removeClass('selected');
            setTimeout(function () {
                $(document).trigger('mousewheel',function (e) {

                });
            },500);
        });
        //var myTop = $('.categories').offset().top;

        $(document).on('scroll',function (event) {
            var scrollTop = $('body').scrollTop();
            console.log(myTop,scrollTop,(myTop - $('#allSortTab').height()*2));
            //console.log(1234);
            var direction = event.originalEvent.wheelDelta;

            //console.log(event, delta, deltaX, deltaY)
            //var scrollTop1 = $(document).offset().top;
            console.log(myTop,scrollTop,(myTop - $('#allSortTab').height()*2));
            //console.log(direction);
            switch(direction){
                case 120:
                    if(scrollTop < (myTop + $('#allSortTab').height()*2)){
                        console.log(2);
                        $('#allSortTab').removeClass('fix-categories');
                    }
                    break;
                case -120:
                    if(scrollTop > myTop){
                        console.log(1);
                        $('#allSortTab').addClass('fix-categories');
                    }
                    break;
            }
        })
        */
    }(jQuery));
    $('#allSortTab').cjdFixUp({
        itemData:'idx'
    });
    /*cjdMenuScroll.options = {
        topMargin:190,
        itemActive:'wefwe',
    }
    cjdMenuScroll.init();*/
</script>