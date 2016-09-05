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
                        <a class="ui-category-item <?php if($index == 0){echo 'selected';} ?>" href="#cate_<?php echo $index+1; ?>" data-idx="<?php echo $index+1; ?>" data-idx="0"><?php echo $cate['name']; ?></a>
                        <?php } ?>
                    </div>
                </div>
            </div>

            <div class="category-items row">

                <div class="col">
                    <?php foreach($categories as $index=>$category){ ?>
                    <?php if($index < ceil(count($categories)/2)){ ?>
                            <div class="item" data-idx="<?php echo $index+1; ?>" id="cate_<?php echo $index+1; ?>">
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
                    <?php } ?>
                </div>
                <div class="col">
                    <?php foreach($categories as $index=>$category){ ?>
                    <?php if($index > ceil(count($categories)/2)-1){ ?>
                    <div class="item" data-idx="<?php echo $index+1; ?>" id="cate_<?php echo $index+1; ?>">
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
                    <?php } ?>
                </div>
            </div>
            <?php } ?>

        </div>

    </div>


</div>

<?php echo $footer; ?>

<script>
    (function ($) {
        var myTop = $('.categories').offset().top - $('.categories').height();
        var lastScrollTop = 0;
        var scrollDir = '';
        $(window).scroll(function () {
            var st = $(this).scrollTop();
            if (st > lastScrollTop){
                scrollDir = 'down';
            } else {
                scrollDir = 'up';
            }
            lastScrollTop = st;
        });
        function is_scroll() {
            var arr = [];
            $('.category-items>.col:first>.item').each(function () {
                arr.push($(this).offset().top - $('#allSortTab').height() * 2 - 20);
            })
            return arr;
        }
        $(document).on('scroll',function (e,target) {
            var scrollTop = $(this).scrollTop();
            /*$('.category-items>.col:first>.item').each(function () {
                (function (obj) {
                    var selector = '[data-idx=' + $(obj).data('idx') + ']';
                    if (scrollTop > $(obj).offset().top - $('#allSortTab').height() * 2 - 20) {
                        $(selector, '.categories').addClass('selected').siblings().removeClass('selected');
                    }
                }(this));
            });*/
            if(scrollDir == 'down'){
                if(scrollTop > myTop){
                    $('#allSortTab').addClass('fix-categories');
                }
            }
            if(scrollDir == 'up'){
                if(scrollTop < (myTop + $('#allSortTab').height()*2)){
                    $('#allSortTab').removeClass('fix-categories');
                }
            }
        });
        $('#allSortTab a').on('click',function () {
            //e.preventDefault();
            var target = $(this).attr('href');
            var offset = $('#allSortTab').height()*2-20;
            var targetScrollTop = $(target).offset().top - offset;
            $('.categories').height($('#allSortTab').height());
            $('body').animate({'scrollTop':targetScrollTop},200);
            $(this).addClass('selected').siblings().removeClass('selected');
            return false;

        });
    }(jQuery));
</script>