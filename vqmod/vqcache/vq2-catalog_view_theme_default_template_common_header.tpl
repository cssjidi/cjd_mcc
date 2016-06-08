<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>

			
			<?php
			/* << Product Option Image PRO module  */ 
      if (isset($poip_installed) && $poip_installed) {  ?>
      <script type="text/javascript"><!--
      
      function poip_show_thumb(elem) {
				
        if ($(elem).attr('data-thumb') && $(elem).attr('data-image_id')) {
								
					var main_img = $('img[data-poip_id="image_'+$(elem).attr('data-image_id')+'"]');
					var prev_img = main_img.attr('src'); // journal2 compatibility
          main_img.attr('src', $(elem).attr('data-thumb'));
          main_img.parent().attr('href', $(elem).attr('href'));
					
          // moment theme compatibility (second image)
          if ( main_img.parent().parent().is('div.product-thumb__primary') ) {
            main_img.parent().parent().siblings('div.product-thumb__secondary').find('a').attr('href', $(elem).attr('href'));
          }
          
					// journal2 compatibility
					if (main_img.parent().hasClass('has-second-image')) {
						main_img.parent().attr('style', main_img.parent().attr('style').replace(prev_img, $(elem).attr('data-thumb')) );
					}
					
        }
      }  
      
      //--></script>
      <?php } ?>
			
			<?php
				if (isset($poip_theme_name) && $poip_theme_name=='cosyone') {
					set_include_path(get_include_path() . PATH_SEPARATOR . DIR_APPLICATION.'/view/theme/cosyone/template/common');
				}
			
			
			
      /* >> Product Option Image PRO module */
			?>
			
			
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
<div class="container">

  <div class="m-allcate">
    <a href="<?php echo $allsort; ?>" class="btn btn-danger btn-block"><span class="pull-left"></span><?php echo $text_allcate; ?><i class="fa fa-angle-right pull-right"></i></a>
  </div>

  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>

    <?php if ($categories && $is_allcate) { ?>
      <nav id="allcate" class="navbar allcate <?php echo $allcate_theme; ?>">
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <div class="allcate-title" id="cate-menu">
            <a href="<?php echo $allsort; ?>">
              <?php echo $text_allcate; ?>
              <span class="fa fa-angle-down"></span>
            </a>
          </div>
          <ul class="nav navbar-nav">
            <?php foreach ($categories as $index=>$category) { ?>
            <?php if ($index < 10) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?>
                <span class="pull-right fa fa-angle-right"></span>
              </a>
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
                </div>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </ul>
        </div>
      </nav>
    <?php } ?>

    <?php if(isset($navs) && $nav_status){ ?>
      <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($navs as $category) { ?>
        <?php if (isset($category['children'])) { ?>
        <li class="dropdown"><a href="<?php echo $category['link']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['title']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <ul class="list-unstyled">
                <?php foreach ($category['children'] as $child) { ?>
                <li><a href="<?php echo $child['link']; ?>"><?php echo $child['title']; ?></a></li>
                <?php } ?>
              </ul>
            </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['link']; ?>"><?php echo $category['title']; ?></a></li>
        <?php } ?>
        <?php } ?>
        <li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li>
        <li><a href="<?php echo $press; ?>"><?php echo $text_press; ?></a></li>
        <li><a href="<?php echo $faq; ?>"><?php echo $text_faq; ?></a></li>
      </ul>
    </div>
    <?php }else if ($categories){ ?>

        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
              <div class="dropdown-menu">
                <div class="dropdown-inner">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                  <ul class="list-unstyled">
                    <?php foreach ($children as $child) { ?>
                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <?php } ?>
                </div>
                <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
            <li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li>
            <li><a href="<?php echo $press; ?>"><?php echo $text_press; ?></a></li>
            <li><a href="<?php echo $faq; ?>"><?php echo $text_faq; ?></a></li>
          </ul>
        </div>

    <?php } ?>
  </nav>
</div>
