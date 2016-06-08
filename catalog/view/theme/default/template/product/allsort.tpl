<?php echo $header; ?>

<div class="container">
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