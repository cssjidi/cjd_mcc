<?php if(isset($navs) && $nav_status){ ?>
    <nav id="menu" class="navbar">
        <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
            <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
        </div>
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
        <?php foreach ($navs as $category) { ?>
        <?php if (isset($category['children']) && count($category['children']) > 0) { ?>
        <li class="dropdown">
            <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown">
                <?php echo $category['title']; ?>
                <span class="<?php echo $category['icon']; ?>"></span>
            </a>
            <div class="dropdown-menu">
                <div class="dropdown-inner">
                    <ul class="list-unstyled">
                        <?php foreach ($category['children'] as $child) { ?>
                        <?php if (isset($child['children']) && count($child['children']) > 0) { ?>
                        <li class="dropdown">
                            <a href="<?php echo $child['href']; ?>">
                                <?php echo $child['title']; ?>
                                <span class="<?php echo $child['icon']; ?>"></span>
                            </a>
                            <div class="dropdown-menu">
                                <div class="dropdown-inner">
                                    <ul class="list-unstyled">
                                        <?php foreach ($child['children'] as $c_level3) { ?>
                                        <li>
                                            <a href="<?php echo $c_level3['href']; ?>">
                                                <?php echo $c_level3['title']; ?>
                                                <span class="<?php echo $c_level3['icon']; ?>"></span>

                                            </a>
                                        </li>
                                        <?php } ?>
                                    </ul>
                                </div>
                        </li>
                        <?php }else{ ?>
                        <li>
                            <a href="<?php echo $child['href']; ?>">
                                <?php echo $child['title']; ?>
                                <span class="<?php echo $child['icon']; ?>"></span>
                            </a>
                        </li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
        </li>
        <?php } else { ?>
        <li>
            <a href="<?php echo $category['href']; ?>">
                <?php echo $category['title']; ?>
                <span class="<?php echo $category['icon']; ?>"></span>
            </a>
        </li>
        <?php } ?>
        <?php } ?>
        <li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li>
        <li><a href="<?php echo $press; ?>"><?php echo $text_press; ?></a></li>
        <li><a href="<?php echo $faq; ?>"><?php echo $text_faq; ?></a></li>
    </ul>
</div>
        </nav>
<?php }