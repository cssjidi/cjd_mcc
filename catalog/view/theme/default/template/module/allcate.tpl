<?php if ($categories && $is_allcate) { ?>
<div class="m-allcate">
    <a href="<?php echo $allsort; ?>" class="btn btn-danger btn-block"><span class="pull-left"></span><?php echo $text_allcate; ?><i class="fa fa-angle-right pull-right"></i></a>
</div>
<nav id="allcate" class="navbar allcate <?php echo $allcate_theme; ?>  <?php echo $is_home ? 'home-hover':''; ?>">
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <div class="allcate-title" id="cate-menu">
            <a href="<?php echo $allsort; ?>">
                <?php echo $text_allcate; ?>
                <span class="fa fa-angle-down"></span>
            </a>

        </div>
        <ul class="nav navbar-nav">
            <?php foreach ($categories as $index=>$category) { ?>
            <?php if ($index < 8) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown" >
                <div class="cate-box">
                    <img src="<?php echo $category['image']; ?>" alt="">
                    <h3>
                        <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown">
                            <?php echo $category['name']; ?>
                        </a>
                    </h3>
                    <div class="sub-cate">
                        <?php foreach ($category['sub_children'] as $sub) { ?>
                            <a href="<?php echo $sub['href']; ?>">
                                <?php echo $sub['name']; ?>
                            </a>
                        <?php } ?>
                    </div>
                </div>
                <div class="dropdown-menu">
                    <div class="dropdown-inner">
                        <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                        <ul class="list-unstyled">
                            <?php foreach ($children as $child) { ?>
                            <li>
                                <?php if(isset($child['children'])) { ?>
                                <dl>
                                    <dt>
                                        <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?>
                                            <?php if(count($child['children'])>0) { ?>
                                            <i class="fa fa-angle-right"></i>
                                            <?php } ?>
                                        </a>
                                    </dt>
                                    <dd>
                                        <?php foreach ($child['children'] as $level3) { ?>
                                        <a href="<?php echo $level3['href']; ?>"><?php echo $level3['name']; ?></a>
                                        <?php } ?>
                                    </dd>
                                </dl>
                                <?php }?>
                            </li>
                            <?php } ?>
                        </ul>
                        <?php } ?>

                        <div class="brands">
                            <h5>
                                <?php echo $text_brands; ?>
                                <a href="<?php echo $more_brands_link; ?>" class="">
                                    <?php echo $text_more_brands; ?>
                                </a>
                            </h5>
                            <div class="brands-list">
                                <?php foreach($category['brands'] as $brand){ ?>
                                    <a href="<?php echo $brand['href']; ?>">
                                        <img src="<?php echo $brand['image']; ?>" width="85" alt="<?php echo $brand['name']; ?>">
                                    </a>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
            </li>
            <?php } else { ?>
            <li>
                <div class="cate-box">
                    <h3>
                        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                    </h3>
                    <div class="sub-cate">
                        <?php foreach ($category['sub_children'] as $sub) { ?>
                        <a href="<?php echo $sub['href']; ?>">
                            <?php echo $sub['name']; ?>
                        </a>
                        <?php } ?>
                    </div>
                </div>

            </li>
            <?php } ?>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
</nav>
<?php } ?>

