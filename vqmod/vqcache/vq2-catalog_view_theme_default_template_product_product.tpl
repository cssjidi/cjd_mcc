<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <?php if ($thumb || $images) { ?>
          <ul class="thumbnails">
            <?php if ($thumb) { ?>
            <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>

      <?php if ( ($poip_theme_name == 'goshop' || $poip_theme_name == 'fastor') && !empty($poip_installed) && !empty($popup) ) {
      // Product Option Image PRO module <<
      // to not show the main image twice
      if ( $image['popup'] == $popup ) continue;
      // >> Product Option Image PRO module
      } ?>
      
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img 
      src="<?php echo $image['thumb']; ?>" title="<?php echo ( (isset($image['title']) && $image['title']) ? ' '.$image['title'] : $heading_title); ?>" alt="<?php echo ((isset($image['title']) && $image['title']) ? ' '.$image['title'] : $heading_title); ?>"
       /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="btn-group">
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
          </div>
          <h1><?php echo $heading_title; ?></h1>
          <ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <?php echo $model; ?></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
            <?php } ?>
            <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
          </ul>
          <?php if ($price) { ?>
          <ul class="list-unstyled">
            <?php if (!$special) { ?>
            <li>
              <h2><?php echo $price; ?></h2>
            </li>
            <?php } else { ?>
            <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
            <li>
              <h2><?php echo $special; ?></h2>
            </li>
            <?php } ?>
            <?php if ($tax) { ?>
            <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
            <?php } ?>
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?>
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <div id="product">
            <?php if ($options) { ?>
            <hr>
            <h3><?php echo $text_option; ?></h3>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />

			<?php
			// << Product Option Image PRO module

			if ($option['type'] == 'radio' && isset($option_value['poip_image']) && $option_value['poip_image'] ) {
				?>
				<img src="<?php echo $option_value['poip_image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
				<?php
			}
			
      // >> Product Option Image PRO module
			?>
			
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />

			<?php
			// << Product Option Image PRO module

			if ($option['type'] == 'checkbox' && isset($option_value['poip_image']) && $option_value['poip_image'] ) {
				?>
				<img src="<?php echo $option_value['poip_image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
				<?php
			}
			
      // >> Product Option Image PRO module
			?>
			
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />

			<?php
			// << Product Option Image PRO module

			if ($option['type'] == 'radio' && isset($option_value['poip_image']) && $option_value['poip_image'] ) {
				?>
				<img src="<?php echo $option_value['poip_image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
				<?php
			}
			
      // >> Product Option Image PRO module
			?>
			
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <div class="form-group">
              <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
              <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <br />
              <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
            </div>
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>
          <?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
            <hr>
            <!-- AddBaidu Share Button BEGIN -->
            <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a><a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a><a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a><a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren"></a><a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a><a title="分享到Facebook" href="#" class="bds_fbook" data-cmd="fbook"></a><a title="分享到Twitter" href="#" class="bds_twi" data-cmd="twi"></a><a title="分享到linkedin" href="#" class="bds_linkedin" data-cmd="linkedin"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin","fbook","twi","linkedin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin","fbook","twi","linkedin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
            <!-- AddBaidu Share Button END -->
          </div>
          <?php } ?>
        </div>
      </div>
      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" <?php /* Product Option Image PRO module << */ if ($poip_installed) { ?> data-poip_id="image_<?php echo "".$current_class."_".$product['product_id']; ?>" <?php } /*  >> Product Option Image PRO module */ ?>alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

      
      <?php // Product Option Image PRO module << ?>
			
      <?php  if ($poip_installed && isset($product['option_images']) && $product['option_images']) {
			
				foreach ($product['option_images'] as $product_option_id => $option_images) {
						
					if ($poip_theme_name == "sellegance" || $poip_theme_name == "theme422"
						|| $poip_theme_name == "polianna" || $poip_theme_name == "moneymaker"
						|| (isset($isAvaStore) && $isAvaStore) ) {
						
						echo "<div data-poip_id=\"poip_img\" style=\"  text-align: center; \">";
						$image_counter = 0;
						foreach ($option_images as $product_option_value_id => $option_image) {
							$image_counter++;
							echo "
											<a ". ($poip_theme_name!="mattimeo" ? "onmouseover=\"poip_show_thumb(this);\"" : "") ."
												style=\"display:inline;\" href=\"".$product['href'].(strpos($product['href'],'?')===false?'?':'&amp;')."poip_ov=".(int)$product_option_value_id."\"
												".( (isset($option_image['title']) && $option_image['title']) ? " title=\"".$option_image['title']."\" " : "" )."
												data-thumb=\"".$option_image['thumb']."\"
												data-image_id=\"".$current_class."_".$product['product_id']."\">
											<img src=\"".$option_image['icon']."\" alt=\"".( (isset($option_image['title']) && $option_image['title']) ? $option_image['title'] : "" )."\"></a>
										";
						}
						echo "</div>";

					} elseif ($poip_theme_name == "pav_styleshop") { // for product_module.tpl
						// just skip
						
					
					
					} else { // OC 2.0 new style default
					
						echo "<div data-poip_id=\"poip_img\" style=\"  text-align: center; margin-top: 3px; \">";
						$image_counter = 0;
						foreach ($option_images as $product_option_value_id => $option_image) {
							$image_counter++;
							echo "
											<a onmouseover=\"poip_show_thumb(this);\" 
												style=\"display:inline;\" href=\"".$product['href'].(strpos($product['href'],'?')===false?'?':'&amp;')."poip_ov=".(int)$product_option_value_id."\"
												".( (isset($option_image['title']) && $option_image['title']) ? " title=\"".$option_image['title']."\" " : "" )."
												data-thumb=\"".$option_image['thumb']."\"
												data-image_id=\"".$current_class."_".$product['product_id']."\">
											<img src=\"".$option_image['icon']."\" class=\"img-thumbnail\" alt=\"".( (isset($option_image['title']) && $option_image['title']) ? $option_image['title'] : "" )."\"></a>
										";
						}
						echo "</div>";
					
					}
					
					/* OC 1.X old-style default
					} else {
					
						echo "<table data-poip_id=\"poip_img\" style=\"width: auto; padding:0px; border-collapse:collapse; border-spacing:0px; border:0px;\"><tr><td style='padding:0px;'>";
						$image_counter = 0;
						foreach ($option_images as $product_option_value_id => $option_image) {
							$image_counter++;
							if ($image_counter % 5 == 0) echo "<br>";
							echo "<div class=\"image\" style=\"float:left; margin-left:0px; margin-right:0px; \">
											<a onmouseover=\"poip_show_thumb(this);\" href=\"".$product['href'].(strpos($product['href'],'?')===false?'?':'&amp;')."poip_ov=".(int)$product_option_value_id."\"
												".( (isset($option_image['title']) && $option_image['title']) ? " title=\"".$option_image['title']."\" " : "" )."
												data-thumb=\"".$option_image['thumb']."\"
												data-image_id=\"".$current_class."_".$product['product_id']."\">
											<img src=\"".$option_image['icon']."\" alt=\"".( (isset($option_image['title']) && $option_image['title']) ? $option_image['title'] : "" )."\"></a>
										</div>";
										
							if ($image_counter % 4 == 0) echo "<br>";
						}
						echo "</td></tr></table>";
					}
					*/
				}
				
				/* OLD 
        foreach ($product['option_images'] as $product_option_id => $option_images) {
          
					if (isset($poip_theme_name) && ($poip_theme_name == "sellegance" || $poip_theme_name == "theme422")) {
						echo "<div data-poip_id=\"poip_img\" style=\"  text-align: center; \">";
						$image_counter = 0;
						foreach ($option_images as $product_option_value_id => $option_image) {
							$image_counter++;
							echo "
											<a onmouseover=\"poip_show_thumb(this);\" style=\"display:inline;\" href=\"".$product['href'].(strpos($product['href'],'?')===false?'?':'&amp;')."poip_ov=".(int)$product_option_value_id."\"
												".( (isset($option_image['title']) && $option_image['title']) ? " title=\"".$option_image['title']."\" " : "" )."
												data-thumb=\"".$option_image['thumb']."\"
												data-image_id=\"".$current_class."_".$product['product_id']."\">
											<img src=\"".$option_image['icon']."\" alt=\"".( (isset($option_image['title']) && $option_image['title']) ? $option_image['title'] : "" )."\"></a>
										";
						}
						echo "</div>";
					} else {
					
						echo "<table dara-poip_id=\"poip_img\" style=\"width: auto; padding:0px; border-collapse:collapse; border-spacing:0px; border:0px;\"><tr><td style='padding:0px;'>";
						$image_counter = 0;
						foreach ($option_images as $product_option_value_id => $option_image) {
							$image_counter++;
							if ($image_counter % 5 == 0) echo "<br>";
							echo "<div class=\"image\" style=\"float:left; margin-left:0px; margin-right:0px; \">
											<a onmouseover=\"poip_show_thumb(this);\" href=\"".$product['href'].(strpos($product['href'],'?')===false?'?':'&amp;')."poip_ov=".(int)$product_option_value_id."\"
												".( (isset($option_image['title']) && $option_image['title']) ? " title=\"".$option_image['title']."\" " : "" )."
												data-thumb=\"".$option_image['thumb']."\"
												data-image_id=\"".$current_class."_".$product['product_id']."\">
											<img src=\"".$option_image['icon']."\" alt=\"".( (isset($option_image['title']) && $option_image['title']) ? $option_image['title'] : "" )."\"></a>
										</div>";
										
							if ($image_counter % 4 == 0) echo "<br>";
						}
						echo "</td></tr></table>";
					}
					
				}
				*/
      
      } ?>
      <?php //  >> Product Option Image PRO module ?>
      
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif ($i % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>

			<?php
				//<< Product Option Image PRO module
				if (isset($poip_theme_name) && ($poip_theme_name=='pav_fashion' || $poip_theme_name=='fashion' || $poip_theme_name=='pav_styleshop' || $poip_theme_name=='megashop'
				|| $poip_theme_name == 'lexus_shopping' || $poip_theme_name == 'pav_sportshop' ) ) { ?>
				<script type="text/javascript"><!--
					$('div.product-action').css('top', '-70px');
					$('a.pav-colorbox').css('top', 'auto');
					$('a.pav-colorbox').css('bottom', '-40px');
				--></script>
				<?php }
				// >> Product Option Image PRO module
				?>
      

      <!-- Product Option Image PRO module << -->
      <?php  if ($poip_installed) {  ?>
        
      <script type="text/javascript"><!--
      var console=console||{"log":function(){},"debug":function(){}};
      var poip_options_settings = <?php echo json_encode($poip_product_settings); ?>;
      var poip_settings = <?php echo json_encode($poip_settings); ?>;
      /*
      <?php
      
      ?>
      */
      var poip_images = <?php echo json_encode($poip_images); ?>;
      var poip_images_by_options = <?php echo json_encode($poip_images_by_options); ?>;
      var poip_product_option_ids = <?php echo json_encode($poip_product_option_ids); ?>;
			
			if ( typeof(poip_images2) != 'undefined' ) {
				poip_images = poip_images2;
			}
			
			var poip_theme_name = '<?php echo isset($poip_theme_name) ? $poip_theme_name : 'default'; ?>';
			if (poip_theme_name == 'default' && typeof(poip_ava_store) !== 'undefined' && poip_ava_store) {
				poip_theme_name = 'ava_store';
			}
			var use_refresh_colorbox = poip_theme_name!='allure' && poip_theme_name!='maxstore' && poip_theme_name!='theme422' && poip_theme_name!='theme500' 
						&& poip_theme_name!='theme533' && poip_theme_name!='theme541' && poip_theme_name!='theme546' && poip_theme_name!='theme560' && poip_theme_name!='theme563'
						&& poip_theme_name!='theme573' && poip_theme_name!='theme593' && poip_theme_name!='theme638' && poip_theme_name!='default' && poip_theme_name!='pavilion'
						&& poip_theme_name!='eagency' && poip_theme_name!='art' && poip_theme_name!='stowear' && poip_theme_name!='themegloballite'
            && poip_theme_name.substr(0, 14) != 'so-shoppystore' && poip_theme_name!='fastor' ;
			//var use_refresh_colorbox = poip_theme_name!='theme422' && poip_theme_name!='polianna';
			
			var poip_std_src = poip_main_image().attr('src');
			var poip_std_href = poip_main_image().closest('a').attr('href');
      if ( poip_theme_name == 'opc1000' ) {
        poip_std_href = $('.product-info .owl-carousel a:first').attr('href');
      }
			
			var option_prefix = "option";
			if ($('[name^="option_oc["]').length) {
				option_prefix = "option_oc";
			}
			var option_prefix_length = option_prefix.length;
			
      // в список может быть включего главное изображений, надо его учесть
			if (poip_theme_name != 'bt_claudine' && poip_theme_name != 'ntl') { // !bt_claudine
				poipImageAdditional().find('a').each(function() {
					var img_src = '';
					if ($(this).attr('data-zoom-image') && poip_theme_name=='mattimeo') {
						img_src = $(this).attr('data-zoom-image');
					}else if ($(this).attr('data-image')) {
						img_src = $(this).attr('data-image');
					} else if ($(this).attr('href') && $(this).attr('href').substr(0,1) != "#") {
						img_src = $(this).attr('href');
					}
					
					if (img_src) {
	
						var img_found = false;
						for (var i=0;i<poip_images.length;i++) {
							if (img_src == poip_images[i]['popup'] || decodeURIComponent(img_src) == poip_images[i]['popup']) {
								img_found = true;
								break;
							}
						}
						if (!img_found) {
							poip_images.unshift({"product_id":"<?php echo $product_id; ?>","product_image_id":["-1"],"popup":"","main":"","thumb":""});
							poip_images[0].popup = img_src;
							poip_images[0].main = img_src;
							poip_images[0].thumb = img_src;
						}
					}
				});
			}
      
			function poip_get_product_option_id_from_name(name) {
				return name.substr(option_prefix_length+1, name.indexOf(']')-(option_prefix_length+1) )
			}
			
      // 1 - без checkbox, 2 - только чекбокс
      function get_selected_values(checkbox_variant, product_option_id) {
			
        var values = [];
				
				var select_string = "";
				if (!checkbox_variant || checkbox_variant==1) {
					select_string += 'select[name^="'+option_prefix+'["], input[type=radio][name^="'+option_prefix+'["]:checked';
				}
				if (!checkbox_variant || checkbox_variant==2) {
					select_string += (select_string=='' ? '' : ', ') + 'input[type=checkbox][name^="'+option_prefix+'["]:checked';
				}
				
				$(select_string).each(function () {
					var current_product_option_id = poip_get_product_option_id_from_name($(this).attr('name'));
					
					if ( (!product_option_id && $.inArray(current_product_option_id, poip_product_option_ids) != -1)
							|| (product_option_id && product_option_id == current_product_option_id) ) {
						
						if ($(this).val()) {
							values.push($(this).val());
						}
						
					}
					
				});
				
				return values;
				
      }
      
      function poip_get_global_visible_images() {
        // изображения которые должны быть видны до применения фильтра
        var global_visible_images = [];
        var images_by_settings = [];
        var selected_values = get_selected_values(); 
        
        for (var i=0; i<poip_images.length; i++) {
					
          if (poip_images[i]['product_image_id']) { // стандартное доп.изображение
            global_visible_images.push(poip_images[i]['popup']);
          } else {
            for (var product_option_id in poip_options_settings) {
              if (poip_options_settings[product_option_id]['img_use'] == 1) { // вкл изображения всех значений
                global_visible_images.push(poip_images[i]['popup']);
              } else if (poip_options_settings[product_option_id]['img_use'] == 2) { // вкл изображения только выбранных значений
                for (var j=0; j<selected_values.length; j++) {
                  if ($.inArray(selected_values[j], poip_images[i]['product_option_value_id'])!=-1) {
                    global_visible_images.push(poip_images[i]['popup']);
                  }
                }
              }
            }
          }
          
        }
        
        if ( poip_theme_name == 'opc1000' && global_visible_images.length == 0 ) {
          global_visible_images.push(poip_std_href);
        }
        
        return global_visible_images;
        
      }
      
      function poip_array_intersection(arr1, arr2) {
        
        var match = [];
        
        $.each(arr1, function (i, val1) {
          if ($.inArray(val1, arr2) != -1) {
            match.push(val1);
          }
        });
        
        return match;
      }
      
      function poip_change_available_images(product_option_id) {
      
				if ($.inArray(product_option_id, poip_product_option_ids)==-1) {
          return;
        }
        
        var global_visible_images = poip_get_global_visible_images();
				var current_visible_images = poip_get_global_visible_images();
				
				for (var i in poip_product_option_ids) {
					
					if (!poip_product_option_ids.hasOwnProperty(i)) continue;
				
					var current_product_option_id = poip_product_option_ids[i];
					var current_product_option_selected_values = get_selected_values(0, current_product_option_id);
					
					if (poip_options_settings[current_product_option_id]['img_limit'] && poip_options_settings[current_product_option_id]['img_use']
						&& current_product_option_selected_values.length ) {
            
						var images_to_show = [];
						for (var j in poip_images) {
							if (poip_images[j]['product_option_value_id'] && poip_images[j]['product_option_value_id'].length) {
								for (var copsv_i in current_product_option_selected_values) {
									if ($.inArray(current_product_option_selected_values[copsv_i], poip_images[j]['product_option_value_id']) !== -1
										&& $.inArray(poip_images[j]['popup'], images_to_show) == -1 ) {
                    
										images_to_show.push(poip_images[j]['popup']);
									}
								}
							}
						}
						
						if ( !images_to_show.length ) {
							continue;
						}
						
						current_visible_images = poip_array_intersection(current_visible_images, images_to_show);
					}
					
				}
				
				if (current_visible_images.length == 0) {
          current_visible_images = global_visible_images;
				}
				
				poip_set_visible_images(current_visible_images);
				
				return current_visible_images;
				
      }
			
			
			function poip_popup_refresh() {
			
				if (poip_theme_name == 'sebian' && $('#image-additional-carousel-quickview').length ) {
					return;
				}
				
				if (!poip_settings['img_gal']) {
					if ( $('li.image-additional').length ) { // OC 2.0 new-style default
						
						// exclude main image from gallery (main image should be present in additional images already)
						$('.thumbnails').magnificPopup({
							type:'image',
							delegate: '.image-additional a',
							gallery: {
								enabled:true
							}
						});
						poip_main_image().off('click', poip_main_aimg_click);
						poip_main_image().on('click', poip_main_aimg_click);
					}
					return;
				}
				
				
				if (poip_theme_name.substr(0, 9) == 'OPC080186' || poip_theme_name.substr(0, 9) == 'OPC080189' || poip_theme_name.substr(0, 9) == 'OPC080190' || poip_theme_name == 'OPC070162') { // Hair Salon || Harvest || Lookz
					
					//$('#additional-carousel').magnificPopup({
					$('.thumbnails').magnificPopup({
						type:'image',
						delegate: '#additional-carousel a:visible',
						gallery: {
							enabled:true
						}
					});
					
					poip_main_image().off('click', poip_main_aimg_click);
					poip_main_image().on('click', poip_main_aimg_click);
				
				} else if ( $('li.image-additional').length ) { // OC 2.0 new-style default
					// OC 2.0 DEFAULT instead of colorbox in OC 1.X
					
					$('.thumbnails').magnificPopup({
						type:'image',
						delegate: '.image-additional a:visible',
						gallery: {
							enabled:true
						}
					});
					poip_main_image().off('click', poip_main_aimg_click);
					poip_main_image().on('click', poip_main_aimg_click);
					
				} else { // OC 1.X and OC 2.0 old-style themes
					refresh_colorbox();
				}
			}
			
			var poip_main_aimg_click = function (event) {
			
				event.preventDefault();
				
				var main_href = $(this).parent().attr('href');
				var img_cnt = 0;
				
				poipImageAdditional().find('a').each(function(){
					if ($(this).attr('href') == main_href) {
						
						if (poip_theme_name.substr(0, 9) == 'OPC080189' || poip_theme_name.substr(0, 9) == 'OPC080190') {
							$('.thumbnails').magnificPopup('open', img_cnt);
						} else {
							$(this).click();
						}
						return;
					}
					img_cnt++;
				});
				
			
			}
			
			function poip_set_visible_images_stowear(images) {
			
				var shown_imgs = [];
				$('#quickview_product .popup-gallery .thumbnails ul li a').each(function(){
					
					if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
						$(this).closest('li').show();
						$(this).attr('disabled', false);
						shown_imgs.push($(this).attr('href'));
						
					} else {
						$(this).closest('li').hide();
						$(this).attr('disabled', true);
					}
					
				});
				
			}
			
			function poip_set_visible_images_pavilion(images, counter) {
				
				if (!counter) counter = 1;
				if (counter == 50) return;
				
				if (!$('.fotorama').length || !$('.fotorama').data('fotorama')) {
					setTimeout(function () {
						poip_set_visible_images_pavilion(images, counter+1);
					}, 100);
					return;
				}
				
				var photorama_data = [];
				
				for (var i in images) {
					photorama_data.push({img: images[i], thumb: poip_get_image_by_src(images[i], 'popup')['thumb']});
				}
				
				$('.fotorama').data('fotorama').load(photorama_data);
				
				// fullscreen gallery
				$('#product .tbGoFullscreen').off('click');
				$('#product .tbGoFullscreen').on('click', function(){
					if (!$(this).hasClass('tbKeyPressed')) {
            lightbox_gallery('PageContentProductSystem_tbW0yqLP2t', photorama_data, $('.fotorama').data('fotorama').activeIndex);
          }
          $(this).addClass('tbKeyPressed');
				});
				
			}
			
			function poip_sort_images_by_selected_options(images_param) {
			
				var images = [];
				var values = get_selected_values();
				
				for (var j in values) {
					if ( !values.hasOwnProperty(j) ) continue;
				
					if (poip_images_by_options && poip_images_by_options[values[j]] && poip_images_by_options[values[j]].length) {
						for (var i in poip_images_by_options[values[j]]) {
							if ( !poip_images_by_options[values[j]].hasOwnProperty(i) ) continue;
						
							if (poip_images_by_options[values[j]][i]['image']) {
								var image = poip_get_image_by_src(poip_images_by_options[values[j]][i]['image'],'image');
								if (image && image['popup'] && $.inArray(image['popup'], images_param) != -1 && $.inArray(image['popup'], images) == -1) {
									images.push(image['popup']);
								}
							}	
						}
					}
				}
				
				for (var i in images_param) {
					if ( !images_param.hasOwnProperty(i) ) continue;
				
					if ( $.inArray(images_param[i], images) == -1 ) {
						images.push(images_param[i]);
					}
				}
			
				return images;
			}
			
			function poip_set_visible_images_eagency(images) {
			
				if ( poipImageAdditional().length ) { 
					var shown_img = [];
					poipImageAdditional().find('a').each( function(){
						// Учтем возможность спец символов типа пробела %20
						if ( $.inArray( $(this).attr('href'), images) != -1 && $.inArray( $(this).attr('href'), shown_img) == -1) {
							$(this).parents('li').show();
							$(this).attr('disabled', false);
							shown_img.push($(this).attr('href'));
						} else {
							$(this).parents('li').hide();
							$(this).attr('disabled', true);
						}
					});
					
					$('.popup-gallery').magnificPopup({
						delegate: 'a:not([disabled])',
						type: 'image',
						tLoading: 'Loading image #%curr%...',
						mainClass: 'mfp-img-mobile',
						gallery: {
							enabled: true,
							navigateByImgClick: true,
							preload: [0,1] // Will preload 0 - before current, and 1 after the current image
						},
						image: {
							tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
							titleSrc: function(item) {
								return item.el.attr('title');
							}
						}
					});

					
					return;
				}
				
			}
			
			function poip_set_visible_images_marketshop(images) {
			
				var shown_img = [];
				poipImageAdditional().find('a').each( function(){
				
					var current_href = $(this).attr('href');
					if ( (!current_href || current_href == '#') ) {
						if ($(this).attr('data-zoom-image')) {
							current_href = $(this).attr('data-zoom-image');
						} else {
							current_href = false;
						}
						if (current_href) {
							if ( $.inArray( current_href, images) != -1 && $.inArray( current_href, shown_img) == -1 ) {
								$(this).show();
								shown_img.push(current_href);
							} else {
								$(this).hide();
							}
						}
					}
        });
				
				<?php if(isset($marketshop_cloud_zoom_gallery) && $marketshop_cloud_zoom_gallery== 1) { ?>
					//////pass the images to swipebox
					
					var swipebox_images = [];
					
					$("#zoom_01").unbind("click");
					$("#zoom_01").bind("click", function(e) {
						
						// order like in gallery
						var ez_list =   $('#zoom_01').data('elevateZoom').getGalleryList();
						for (var i in ez_list) {
							if ( $.inArray(ez_list[i].href, shown_img) != -1 ) {
								swipebox_images.push(ez_list[i]);
							}
						}
						$.swipebox(swipebox_images);	
						
						//$.swipebox(ez.getGalleryList());
						return false;
					});
				<?php } ?>
			
			}
			
			function poip_set_visible_images_theme500(images) { // Cycling Equipment theme
			
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					//if ( $.inArray($(this).attr('data-image'), current_imgs) == -1) {
						current_imgs.push($(this).attr('data-image'));
					//}
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional">'+new_html+'</ul>');
				
				
				$('#image-additional').bxSlider({
					mode: 'vertical',
					pager: false,
					controls: true,
					slideMargin: 13,
					minSlides: 6,
					maxSlides: 6,
					slideWidth: 88,
					nextText: '<i class="fa fa-chevron-down"></i>',
					prevText: '<i class="fa fa-chevron-up"></i>',
					infiniteLoop: false,
					adaptiveHeight: true,
					moveSlides: 1
				});
				
				
				$('#image-additional').find('[data-image]').click(function (e) {
					e.preventDefault();
					var img = $(this).data('image');
					
					$('#gallery_zoom').attr('src', img);
					$('#gallery_zoom').attr('data-zoom-image', img);
					$('.zoomContainer .zoomWindowContainer div').css({"background-image": 'url("'+img+'")'});
					
						
				})
				
				$('#image-additional').find('a').mouseover(function(){
					poip_image_mouseover(this);
				});
				
			
			}
			
			function poip_set_visible_images_theme533(images) { // Clothing for Everyone theme (2016/01/12)
				
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				// for second gallery (used for mobile devices)
				if ( !$('#poip_images_gallery').length ) {
					$('#full_gallery').before('<div id="poip_images_gallery" style="display:none;"></div>');
					$('#full_gallery a').each(function(){
						$('#poip_images_gallery').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					//if ( $.inArray($(this).attr('data-image'), current_imgs) == -1) {
						current_imgs.push($(this).attr('data-image'));
					//}
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional">'+new_html+'</ul>');
				
				$('#image-additional').bxSlider({
					mode:'vertical',
					pager:false,
					controls:true,
					slideMargin:13,
					minSlides: 6,
					maxSlides: 6,
					slideWidth:88,
					nextText: '<i class="fa fa-chevron-down"></i>',
					prevText: '<i class="fa fa-chevron-up"></i>',
					infiniteLoop:false,
					adaptiveHeight:true,
					moveSlides:1
				});
				
				// elevateZoom destroy
				$.removeData($("#gallery_zoom"), 'elevateZoom');
				$('.zoomContainer').remove();
				$("#gallery_zoom").elevateZoom({gallery:'image-additional', cursor: 'pointer',zoomType : 'inner', galleryActiveClass: 'active', imageCrossfade: true}); 
				
				// refill second gallery (for mobile devices)
				var second_shown_imgs = [];
				var second_new_html = '';
				$('#poip_images_gallery').find('a').each( function(){
					if ( $.inArray( $(this).attr('href'), images) != -1 && $.inArray( $(this).attr('href'), second_shown_imgs) == -1) {
						second_new_html+= '<li>'+poip_outerHTML($(this))+'</li>';
						second_shown_imgs.push($(this).attr('data-image'));
					}
				});
				$('#full_gallery').html('<ul id="gallery">'+second_new_html+'</ul>');
				
				$('#gallery').bxSlider({
					pager:false,
					controls:true,
					minSlides: 1,
					maxSlides: 1,
					infiniteLoop:false,
					moveSlides:1
				});
				
				
				$('#image-additional').find('a').mouseover(function(){
					poip_image_mouseover(this);
				});
				
			
			}
			
			function poip_set_visible_images_theme541(images) { // Eyewear theme
				
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					if ( $.inArray($(this).attr('data-image'), current_imgs) == -1) {
						current_imgs.push($(this).attr('data-image'));
					}
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional">'+new_html+'</ul>');
				
				
				$('#image-additional').bxSlider({
						mode: 'vertical',
						pager: false,
						controls: true,
						slideMargin: 13,
						minSlides: 5,
						maxSlides: 5,
						slideWidth: 88,
						nextText: '<i class="fa fa-chevron-down"></i>',
						prevText: '<i class="fa fa-chevron-up"></i>',
						infiniteLoop: false,
						adaptiveHeight: true,
						moveSlides: 1
				});
				
				
				$('#image-additional').find('[data-image]').click(function (e) {
						e.preventDefault();
						var img = $(this).data('image');
						$('#product-image').find('.inner img').each(function () {
								$(this).attr('src', img);
						})
				})
				
				$('#image-additional').find('a').mouseover(function(){
					poip_image_mouseover(this);
				});
				
			
			}
			
			function poip_set_visible_images_theme546(images) { // AudioGear theme
			
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					if ( $.inArray($(this).attr('data-image'), current_imgs) == -1) {
						current_imgs.push($(this).attr('data-image'));
					}
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional">'+new_html+'</ul>');
				
				
				$('#image-additional').bxSlider({
					mode:'vertical',
					pager:false,
					controls:true,
					slideMargin:13,
					minSlides: 5,
					maxSlides: 5,
					slideWidth:99,
					nextText: '<i class="fa fa-chevron-down"></i>',
					prevText: '<i class="fa fa-chevron-up"></i>',
					infiniteLoop:false,
					adaptiveHeight:true,
					moveSlides:1
				});
				
				/*
				$('#image-additional').find('[data-image]').click(function (e) {
						e.preventDefault();
						var img = $(this).data('image');
						$('#gallery_zoom').attr('src', img);
						$('#gallery_zoom').attr('data-zoom-image', img);
						//$('#product-image').find('.inner img').each(function () {
						//		$(this).attr('src', img);
						//})
				});
				*/
				// elevateZoom destroy
				$.removeData($("#gallery_zoom"), 'elevateZoom');
				$('.zoomContainer').remove();
				$("#gallery_zoom").elevateZoom({gallery:'image-additional', cursor: 'pointer',zoomType : 'inner', galleryActiveClass: 'active', imageCrossfade: true}); 
				
				$('#image-additional').find('a').mouseover(function(){
					poip_image_mouseover(this);
				});
				
			
			}
			
			
			function poip_set_visible_images_theme560(images) { // Goodies For Sleep theme by Hermes (2016/02/01) 
			
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				// for second gallery (used for mobile devices)
				if ( !$('#poip_images_gallery').length ) {
					$('#full_gallery').before('<div id="poip_images_gallery" style="display:none;"></div>');
					$('#full_gallery a').each(function(){
						$('#poip_images_gallery').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					//if ( $.inArray($(this).attr('data-image'), current_imgs) == -1) {
						current_imgs.push($(this).attr('data-image'));
					//}
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional" class="image-additional">'+new_html+'</ul>');
				
				$('#image-additional').bxSlider({
						mode: 'vertical',
						pager: false,
						controls: true,
						slideMargin: 13,
						minSlides: 5,
						maxSlides: 5,
						slideWidth: 88,
						nextText: '<i class="fa fa-chevron-down"></i>',
						prevText: '<i class="fa fa-chevron-up"></i>',
						infiniteLoop: false,
						adaptiveHeight: true,
						moveSlides: 1
				});
				
				// elevateZoom destroy
				//$.removeData($("#gallery_zoom"), 'elevateZoom');
				//$('.zoomContainer').remove();
				//$("#gallery_zoom").elevateZoom({gallery:'image-additional', cursor: 'pointer',zoomType : 'inner', galleryActiveClass: 'active', imageCrossfade: true});
				
				
				
				// refill second gallery (for mobile devices)
				var second_shown_imgs = [];
				var second_new_html = '';
				$('#poip_images_gallery').find('a').each( function(){
					if ( $.inArray( $(this).attr('href'), images) != -1 && $.inArray( $(this).attr('href'), second_shown_imgs) == -1) {
						second_new_html+= '<li>'+poip_outerHTML($(this))+'</li>';
						second_shown_imgs.push($(this).attr('data-image'));
					}
				});
				$('#full_gallery').html('<ul id="gallery">'+second_new_html+'</ul>');
				
				$('#gallery').bxSlider({
						pager: false,
						controls: true,
						minSlides: 1,
						maxSlides: 1,
						infiniteLoop: false,
						moveSlides: 1
				});
				
				//myPhotoSwipe = $("#gallery a").photoSwipe({ enableMouseWheel: false , enableKeyboard: false, captionAndToolbarAutoHideDelay:0 });
				
				// main image click rebind
				$('#image-additional').find('li:first-child a').addClass('active');
				$('#product-image').off("click");
				$('#product-image').on("click", function (e) {
						var imgArr = [];
						$('#image-additional').find('a').each(function () {
								img_src = $(this).data("image");

								//put the current image at the start
								if (img_src == $('#product-image').find('img').attr('src')) {
										imgArr.unshift({
												href: '' + img_src + '',
												title: $(this).find('img').attr("title")
										});
								}
								else {
										imgArr.push({
												href: '' + img_src + '',
												title: $(this).find('img').attr("title")
										});
								}
						});
						$.fancybox(imgArr);
						return false;
				});
				
				// additional images click rebind
				$('#image-additional').find('[data-image]').click(function (e) {
						e.preventDefault();
						$('#image-additional').find('.active').removeClass('active');
						var img = $(this).data('image');
						$(this).addClass('active');
						$('#product-image').find('.inner img').each(function () {
								$(this).attr('src', img);
						})
				})
				
				
				$('#image-additional').find('a').mouseover(function(){
					poip_image_mouseover(this);
				});
				
			
			}
      
      function poip_set_visible_images_theme563(images) { // Existore theme by Hermes (2016/02/24) 
			
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				// for second gallery (used for mobile devices)
				if ( !$('#poip_images_gallery').length ) {
					$('#full_gallery').before('<div id="poip_images_gallery" style="display:none;"></div>');
					$('#full_gallery a').each(function(){
						$('#poip_images_gallery').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					//if ( $.inArray($(this).attr('data-image'), current_imgs) == -1) {
						current_imgs.push($(this).attr('data-image'));
					//}
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional" class="image-additional">'+new_html+'</ul>');
				
				$('#image-additional').bxSlider({
						mode: 'vertical',
						pager: false,
						controls: true,
						slideMargin: 13,
						minSlides: 5,
						maxSlides: 5,
						slideWidth: 88,
						nextText: '<i class="fa fa-chevron-down"></i>',
						prevText: '<i class="fa fa-chevron-up"></i>',
						infiniteLoop: false,
						adaptiveHeight: true,
						moveSlides: 1
				});
				
				// elevateZoom destroy
				//$.removeData($("#gallery_zoom"), 'elevateZoom');
				//$('.zoomContainer').remove();
				//$("#gallery_zoom").elevateZoom({gallery:'image-additional', cursor: 'pointer',zoomType : 'inner', galleryActiveClass: 'active', imageCrossfade: true});
				
				
				
				// refill second gallery (for mobile devices)
				var second_shown_imgs = [];
				var second_new_html = '';
				$('#poip_images_gallery').find('a').each( function(){
					if ( $.inArray( $(this).attr('href'), images) != -1 && $.inArray( $(this).attr('href'), second_shown_imgs) == -1) {
						second_new_html+= '<li>'+poip_outerHTML($(this))+'</li>';
						second_shown_imgs.push($(this).attr('href'));
					}
				});
				$('#full_gallery').html('<ul id="gallery">'+second_new_html+'</ul>');
				
				$('#gallery').bxSlider({
						pager: false,
						controls: true,
						minSlides: 1,
						maxSlides: 1,
						infiniteLoop: false,
						moveSlides: 1
				});
				
        // for mobile
				myPhotoSwipe = $("#gallery a").photoSwipe({ enableMouseWheel: false , enableKeyboard: false, captionAndToolbarAutoHideDelay:0 });
				
				// main image click rebind
				$('#image-additional').find('li:first-child a').addClass('active');
				$('#product-image').off("click");
				$('#product-image').on("click", function (e) {
						var imgArr = [];
						$('#image-additional').find('a').each(function () {
								img_src = $(this).data("image");

								//put the current image at the start
								if (img_src == $('#product-image').find('img').attr('src')) {
										imgArr.unshift({
												href: '' + img_src + '',
												title: $(this).find('img').attr("title")
										});
								}
								else {
										imgArr.push({
												href: '' + img_src + '',
												title: $(this).find('img').attr("title")
										});
								}
						});
						$.fancybox(imgArr);
						return false;
				});
				
				// additional images click rebind
				$('#image-additional').find('[data-image]').click(function (e) {
						e.preventDefault();
						$('#image-additional').find('.active').removeClass('active');
						var img = $(this).data('image');
						$(this).addClass('active');
						$('#product-image').find('.inner img').each(function () {
								$(this).attr('src', img);
						})
				})
				
				if (poip_settings['img_hover']) {
          $('#image-additional').find('a').mouseover(function(){
            poip_image_mouseover(this);
          });
				}
			
			}
      
      
      function poip_set_visible_images_theme573(images, counter) { // Flooring theme by Ares (2016/04/08) 
			
        clearTimeout(poip_set_visible_images_timeout_id);
        if (!counter) counter = 1;
				if (counter == 50) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
      
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				// for second gallery (used for mobile devices)
				if ( !$('#poip_images_gallery').length ) {
					$('#full_gallery').before('<div id="poip_images_gallery" style="display:none;"></div>');
					$('#full_gallery a').each(function(){
						$('#poip_images_gallery').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					current_imgs.push($(this).attr('data-image'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
			
        var new_html = '';
        for ( var i in images ) {
          if ( !images.hasOwnProperty(i) ) continue;
          var elem_img = $('#poip_images a[data-image="'+images[i]+'"]:first');
          if ( elem_img.length ) {
            new_html+= poip_outerHTML(elem_img.parent());
          }
        }
      
        /*
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
					}
				});
        */
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional" class="image-additional">'+new_html+'</ul>');
				
        $('#image-additional').bxSlider({
            mode: 'vertical',
            pager: false,
            controls: true,
            slideMargin: 13,
            minSlides: 4,
            maxSlides: 4,
            slideWidth: 88,
            nextText: '<i class="fa fa-chevron-down"></i>',
            prevText: '<i class="fa fa-chevron-up"></i>',
            infiniteLoop: false,
            adaptiveHeight: true,
            moveSlides: 1
        });
        
				// elevateZoom destroy
				//$.removeData($("#gallery_zoom"), 'elevateZoom');
				//$('.zoomContainer').remove();
				//$("#gallery_zoom").elevateZoom({gallery:'image-additional', cursor: 'pointer',zoomType : 'inner', galleryActiveClass: 'active', imageCrossfade: true});
				
				
				
				// refill second gallery (for mobile devices)
        var second_new_html = '';
        for ( var i in images ) {
          if ( !images.hasOwnProperty(i) ) continue;
          var elem_img = $('#poip_images_gallery a[href="'+images[i]+'"]:first');
          if ( elem_img.length ) {
            second_new_html+= '<li>'+poip_outerHTML(elem_img)+'</li>';
          }
        }
        
        /*
				var second_shown_imgs = [];
				var second_new_html = '';
				$('#poip_images_gallery').find('a').each( function(){
					if ( $.inArray( $(this).attr('href'), images) != -1 && $.inArray( $(this).attr('href'), second_shown_imgs) == -1) {
						second_new_html+= '<li>'+poip_outerHTML($(this))+'</li>';
						second_shown_imgs.push($(this).attr('href'));
					}
				});
        */
				$('#full_gallery').html('<ul id="gallery">'+second_new_html+'</ul>');
				
				$('#gallery').bxSlider({
						pager: false,
						controls: true,
						minSlides: 1,
						maxSlides: 1,
						infiniteLoop: false,
						moveSlides: 1
				});
				
        // for mobile
				//myPhotoSwipe = $("#gallery a").photoSwipe({ enableMouseWheel: false , enableKeyboard: false, captionAndToolbarAutoHideDelay:0 });
				
				// main image click rebind
				$('#image-additional').find('li:first-child a').addClass('active');
				$('#product-image').off("click");
				$('#product-image').on("click", function (e) {
						var imgArr = [];
						$('#image-additional').find('a').each(function () {
								img_src = $(this).data("image");

								//put the current image at the start
								if (img_src == $('#product-image').find('img').attr('src')) {
										imgArr.unshift({
												href: '' + img_src + '',
												title: $(this).find('img').attr("title")
										});
								}
								else {
										imgArr.push({
												href: '' + img_src + '',
												title: $(this).find('img').attr("title")
										});
								}
						});
						$.fancybox(imgArr);
						return false;
				});
				
				// additional images click rebind
				$('#image-additional').find('[data-image]').click(function (e) {
						e.preventDefault();
						$('#image-additional').find('.active').removeClass('active');
						var img = $(this).data('image');
						$(this).addClass('active');
						$('#product-image').find('.inner img').each(function () {
								$(this).attr('src', img);
						})
				})
				
				if (poip_settings['img_hover']) {
          $('#image-additional').find('a').mouseover(function(){
            poip_image_mouseover(this);
          });
				}
        
        poip_set_visible_images_timeout_id = false;
			
			}
			
			
			function poip_set_visible_images_theme593(images) { // Magazines Store theme
			
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				// for second gallery (used for mobile devices)
				if ( !$('#poip_images_gallery').length ) {
					$('#full_gallery').before('<div id="poip_images_gallery" style="display:none;"></div>');
					$('#full_gallery a').each(function(){
						$('#poip_images_gallery').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					current_imgs.push($(this).attr('data-image'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
						
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional" class="image-additional">'+new_html+'</ul>');
				
				
				// refill second gallery (for mobile devices)
				var second_shown_imgs = [];
				var second_new_html = '';
				$('#poip_images_gallery').find('a').each( function(){
					if ( $.inArray( $(this).attr('href'), images) != -1 && $.inArray( $(this).attr('href'), second_shown_imgs) == -1) {
						second_new_html+= '<li>'+poip_outerHTML($(this))+'</li>';
						second_shown_imgs.push($(this).attr('data-image'));
					}
				});
				$('#full_gallery').html('<ul id="gallery">'+second_new_html+'</ul>');
				
				
				setTimeout( function () {
					
					var o = $('#image-additional');
					var o2 = $('#gallery');
					/*
					if (o.length || o2.length) {
							include('js/jquery.bxslider/jquery.bxslider.js');
					}
					*/
				
					if (o.length) {
							$(document).ready(function () {
									$('#image-additional').bxSlider({
											mode: 'vertical',
											pager: false,
											controls: true,
											slideMargin: 13,
											minSlides: 4,
											maxSlides: 4,
											slideWidth: 88,
											nextText: '<i class="fa fa-chevron-down"></i>',
											prevText: '<i class="fa fa-chevron-up"></i>',
											infiniteLoop: false,
											adaptiveHeight: true,
											moveSlides: 1
									});
							});
					}
				
					if (o2.length) {
							/*
							include('js/photo-swipe/klass.min.js');
							include('js/photo-swipe/code.photoswipe.jquery-3.0.5.js');
							include('js/photo-swipe/code.photoswipe-3.0.5.min.js');
							*/
							$(document).ready(function () {
									$('#gallery').bxSlider({
											pager: false,
											controls: true,
											minSlides: 1,
											maxSlides: 1,
											infiniteLoop: false,
											moveSlides: 1
									});
							});
					}
					
					o.find('li:first-child a').addClass('active');

					$('#product-image').bind("click", function (e) {
							var imgArr = [];
							o.find('a').each(function () {
									img_src = $(this).data("image");

									//put the current image at the start
									if (img_src == $('#product-image').find('img').attr('src')) {
											imgArr.unshift({
													href: '' + img_src + '',
													title: $(this).find('img').attr("title")
											});
									}
									else {
											imgArr.push({
													href: '' + img_src + '',
													title: $(this).find('img').attr("title")
											});
									}
							});
							$.fancybox(imgArr);
							return false;
					});
					
					o.find('[data-image]').click(function (e) {
							e.preventDefault();
							o.find('.active').removeClass('active');
							var img = $(this).data('image');
							$(this).addClass('active');
							$('#product-image').find('.inner img').each(function () {
									$(this).attr('src', img);
							})
					})
					
					
					$('#image-additional').find('a').mouseover(function(){
						poip_image_mouseover(this);
					});
				}, 0);
			
			}
			
			function poip_set_visible_images_theme638(images) { // VIVA theme
			
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					current_imgs.push($(this).attr('data-image'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
						
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional" class="image-additional">'+new_html+'</ul>');
				
				setTimeout( function () {
					$('#image-additional').bxSlider({
							mode: 'vertical',
							pager: false,
							controls: true,
							slideMargin: 13,
							minSlides: 4,
							maxSlides: 4,
							slideWidth: 88,
							nextText: '<i class="material-icons-expand_more"></i>',
							prevText: '<i class="material-icons-expand_less"></i>',
							infiniteLoop: false,
							adaptiveHeight: true,
							moveSlides: 1
					});
					
					
					/*
					// elevateZoom destroy
					$.removeData($("#gallery_zoom"), 'elevateZoom');
					$('.zoomContainer').remove();
					$("#gallery_zoom").elevateZoom({gallery:'image-additional', cursor: 'pointer',zoomType : 'inner', galleryActiveClass: 'active', imageCrossfade: true});
					*/
					
					var o = $('#image-additional');
					
					o.find('li:first-child a').addClass('active');
	
					$('#product-image').bind("click", function (e) {
						var imgArr = [];
						o.find('a').each(function () {
							img_src = $(this).data("image");
	
							//put the current image at the start
							if (img_src == $('#product-image').find('img').attr('src')) {
								imgArr.unshift({
									href: '' + img_src + '',
									title: $(this).find('img').attr("title")
								});
							}
							else {
								imgArr.push({
									href: '' + img_src + '',
									title: $(this).find('img').attr("title")
								});
							}
						});
						$.fancybox(imgArr);
						return false;
					});
	
	
					o.find('[data-image]').click(function (e) {
							e.preventDefault();
							o.find('.active').removeClass('active');
							var img = $(this).data('image');
							$(this).addClass('active');
							$('#product-image').find('.inner img').each(function () {
									$(this).attr('src', img);
							})
					});
					
					
					$('#image-additional').find('a').mouseover(function(){
						poip_image_mouseover(this);
					});
				}, 0);
			
			}
			
			function poip_set_visible_images_bt_claudine(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('#boss-image-additional-zoom').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#boss-image-additional-zoom').before('<div id="poip_images" style="display:none;"></div>');
						$('#boss-image-additional-zoom li').each(function(){
							$('#poip_images').append( poip_outerHTML($(this)) );
						});
					}
					
					if (!$('#boss-image-additional-zoom').data('_cfs_isCarousel')) {
						setTimeout(function(){ poip_set_visible_images_bt_claudine(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('#boss-image-additional-zoom').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					var elems_cnt = $('#boss-image-additional-zoom li').length;
					for (var i = 1; i<=elems_cnt; i++ ) {
						$('#boss-image-additional-zoom').trigger('removeItem', ['end']);
					}
					
					var shown_imgs = [];
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							$('#boss-image-additional-zoom').trigger('insertItem', [poip_outerHTML($(this).parent()), 'end']);
							shown_imgs.push( $(this).attr('href') );
						}
					});
					
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('#boss-image-additional-zoom li a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}
			
			}
			
			var poip_set_visible_images_timeout_id = false;
			
			function poip_set_visible_images_bt_comohos(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
			
				if ( $('#boss-image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#boss-image-additional').before('<div id="poip_images" style="display:none;"></div>');
						$('#boss-image-additional li').each(function(){
							$('#poip_images').append( poip_outerHTML($(this)) );
						});
					}
					
					if (!$('#boss-image-additional').data('_cfs_isCarousel') || !($('.cloud-zoom, .cloud-zoom-gallery').data('zoom'))) {
						poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_bt_comohos(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('#boss-image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					
					var elems_cnt = $('#boss-image-additional li').length;
					for (var i = 1; i<=elems_cnt; i++ ) {
						$('#boss-image-additional').trigger('removeItem', ['end']);
					}
					
					var shown_imgs = [];
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							$('#boss-image-additional').trigger('insertItem', [poip_outerHTML($(this).parent()), 'end']);
							shown_imgs.push( $(this).attr('href') );
						}
					});
					
					$('#wrap div.mousetrap').remove();
					//CloudZoom.quickStart();
					//$('.cloud-zoom, .cloud-zoom-gallery').data('zoom').destroy();
					//$('.cloud-zoom, .cloud-zoom-gallery').removeData('zoom')
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					//$('#boss-image-additional .cloud-zoom, #boss-image-additional .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('#boss-image-additional li a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
					if ( $.fn.fancybox ) { // boss zoom
						var gallerylist = [];
						
						for (var i in shown_imgs) {
							if ( !shown_imgs.hasOwnProperty(i) ) continue;
							
							gallerylist.push({
								href: shown_imgs[i],
								title: "<?php echo $heading_title; ?>"
							});
							
						}
						
						$("#wrap").unbind('click');
						$("#wrap").bind('click',function(){    
							$.fancybox.open(gallerylist);
							return false;
						});
					}
					
					
				}
				
				poip_set_visible_images_timeout_id = false;
			
			}
      
      function poip_set_visible_images_bt_superexpress(images, counter) { // 2016/03/09
      
        clearTimeout(poip_set_visible_images_timeout_id);
        if (!counter) counter = 1;
				if (counter == 50) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
          
        if ( $('#boss-image-additional-zoom').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#boss-image-additional-zoom').before('<div id="poip_images" style="display:none;"></div>');
						$('#boss-image-additional-zoom li').each(function(){
							$('#poip_images').append( poip_outerHTML($(this)) );
						});
					}
					
          if ( poip_svi_first_call ) {
            if (!$('#boss-image-additional-zoom').data('_cfs_isCarousel')) {
              poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_bt_superexpress(images, counter+1); }, 100);
              return;
            }
            poip_svi_first_call = false;
          }
          
					var current_imgs = [];
					$('#boss-image-additional-zoom').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					var elems_cnt = $('#boss-image-additional-zoom li').length;
					for (var i = 1; i<=elems_cnt; i++ ) {
						$('#boss-image-additional-zoom').trigger('removeItem', ['end']);
					}
          
					var shown_imgs = [];
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							$('#boss-image-additional-zoom').trigger('insertItem', [poip_outerHTML($(this).parent()), 'end']);
							shown_imgs.push( $(this).attr('href') );
						}
					});
          
          $('#wrap div.mousetrap').remove();
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('#boss-image-additional-zoom li a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
          
          if ( $.fn.fancybox ) { // boss zoom
						var gallerylist = [];
						
						for (var i in shown_imgs) {
							if ( !shown_imgs.hasOwnProperty(i) ) continue;
							
							gallerylist.push({
								href: shown_imgs[i],
								title: "<?php echo $heading_title; ?>"
							});
							
						}
						
						$("#bt_viewlarge").unbind('click');
						$("#bt_viewlarge").bind('click',function(){    
							$.fancybox.open(gallerylist);
							return false;
						});
					}
					
				}
				
				poip_set_visible_images_timeout_id = false;
			
			}
      
      function poip_set_visible_images_bt_leather(images, counter) { // 2016/03/24
      
        clearTimeout(poip_set_visible_images_timeout_id);
        if (!counter) counter = 1;
				if (counter == 50) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
        
        var carousel_selector = '#boss-image-additional-zoom';
        var carousel_elem = $(carousel_selector);
          
        if ( carousel_elem.length ) {
					
					if ( !$('#poip_images').length ) {
						carousel_elem.before('<div id="poip_images" style="display:none;"></div>');
						carousel_elem.find('li').each(function(){
							$('#poip_images').append( poip_outerHTML($(this)) );
						});
					}
					
          if ( poip_svi_first_call ) {
            if (!carousel_elem.data('_cfs_isCarousel')) {
              poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_bt_leather(images, counter+1); }, 100);
              return;
            }
            poip_svi_first_call = false;
          }
          
					var current_imgs = [];
					carousel_elem.find('a').each( function(){
						current_imgs.push($(this).attr('href'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					var elems_cnt = carousel_elem.find('li').length;
					for (var i = 1; i<=elems_cnt; i++ ) {
						carousel_elem.trigger('removeItem', ['end']);
					}
          
          var shown_imgs = [];
          for (var i in images) {
            if ( !images.hasOwnProperty(i) ) continue;
            
            var elem = $('#poip_images a[href="'+images[i]+'"]:first');
            if (elem.length) {
              carousel_elem.trigger('insertItem', [poip_outerHTML(elem.parent()), 'end']);
							shown_imgs.push( elem.attr('href') );
              //html += '<div>'+ poip_outerHTML(elem) +'</div>';
            }
            
          }
          /*
					var shown_imgs = [];
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							carousel_elem.trigger('insertItem', [poip_outerHTML($(this).parent()), 'end']);
							shown_imgs.push( $(this).attr('href') );
						}
					});
          */
          
          $('#wrap div.mousetrap').remove();
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						carousel_elem.find('li a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
          
          if ( $.fn.fancybox ) { // boss zoom
						var gallerylist = [];
						
						for (var i in shown_imgs) {
							if ( !shown_imgs.hasOwnProperty(i) ) continue;
							
							gallerylist.push({
								href: shown_imgs[i],
								title: "<?php echo $heading_title; ?>"
							});
							
						}
						
						$("#bt_viewlarge").unbind('click');
						$("#bt_viewlarge").bind('click',function(){    
							$.fancybox.open(gallerylist);
							return false;
						});
					}
					
				}
				
				poip_set_visible_images_timeout_id = false;
			
			}
      
      function poip_set_visible_images_up_theme(images, counter) { // 2016/03/24
      
        clearTimeout(poip_set_visible_images_timeout_id);
        if (!counter) counter = 1;
				if (counter == 50) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
        
        var carousel_selector = '.image-additional-wrapper';
        var carousel_elem = $(carousel_selector);
          
        if ( carousel_elem.length ) {
					
					if ( !$('#poip_images').length ) {
						carousel_elem.before('<div id="poip_images" style="display:none;"></div>');
						carousel_elem.find('a').each(function(){
							$('#poip_images').append( poip_outerHTML($(this)) );
						});
					}
					
          var current_carousel = carousel_elem.data('owlCarousel');
					
          if ( poip_svi_first_call ) {
            if (!current_carousel || !carousel_elem.find('.owl-item').length || document.readyState != "complete" ) {
              poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_up_theme(images, counter+1); }, 100);
              return;
            }
            poip_svi_first_call = false;
          }
          
					var current_imgs = [];
					carousel_elem.find('a').each( function(){
						current_imgs.push($(this).attr('href'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
          
          var shown_imgs = [];
          var html = '';
          for (var i in images) {
            if ( !images.hasOwnProperty(i) ) continue;
            
            var elem = $('#poip_images a[href="'+images[i]+'"]:first');
            if (elem.length) {
              html += '<li class="image-additional col-sm-12"><div>'+ poip_outerHTML(elem) +'</div></li>';
              shown_imgs.push( elem.attr('href') );
            }
          }
          
          carousel_elem.replaceWith('<ul class="image-additional-wrapper thumbnails">'+html+'</ul>');
          
          carousel_elem = $(carousel_selector);
          carousel_elem.owlCarousel({
            items: 3,
            singleItem: false,
            pagination: true,
            navigation: true,
            navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
          });
          
          $('.cloud-zoom-wrap div.mousetrap').remove();
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						carousel_elem.find('li a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
          /*
          if ( $.fn.fancybox ) { // boss zoom
						var gallerylist = [];
						
						for (var i in shown_imgs) {
							if ( !shown_imgs.hasOwnProperty(i) ) continue;
							
							gallerylist.push({
								href: shown_imgs[i],
								title: "<?php echo $heading_title; ?>"
							});
							
						}
						
						$("#bt_viewlarge").unbind('click');
						$("#bt_viewlarge").bind('click',function(){    
							$.fancybox.open(gallerylist);
							return false;
						});
					}
          */
					
				}
				
				poip_set_visible_images_timeout_id = false;
			
			}
			
			function poip_set_visible_images_OPC080183(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 100) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
				
				if ( !$('#poip_images').length ) {
					$('#carousel').before('<div id="poip_images" style="display:none;"></div>');
					var added_img = [];
					$('#carousel li').each(function(){
						if ( $.inArray($(this).find('img').attr('data-large'), added_img) == -1 ) {
							$('#poip_images').append( $(this).clone() );
							added_img.push($(this).find('img').attr('data-large'));
						}
					});
				}
				
				// second hidden list
				if ( !$('#poip_slider').length ) {
					$('#slider').before('<div id="poip_slider" style="display:none;"></div>');
					var added_img = [];
					$('#slider li').each(function(){
						if ( $.inArray($(this).find('a').attr('href'), added_img) == -1 ) {
							$('#poip_slider').append( $(this).clone() );
							added_img.push($(this).find('a').attr('href'));
						}
					});
				}
				
				if ( !$('#carousel .flex-viewport').length ) {
					poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_OPC080183(images, counter+1); }, 100);
					return;
				}
					
				var current_imgs = [];
				$('#carousel').find('img').each( function(){
					current_imgs.push($(this).attr('data-large'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
				
				var flexslider = $('#carousel').data('flexslider');
				var elems_cnt = flexslider.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider.removeSlide(i);
					$('#carousel .flex-viewport li:first').remove();
				}
				
				var flexslider2 = $('#slider').data('flexslider');
				var elems_cnt = flexslider2.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider2.removeSlide(i);
					$('#slider li:first').remove();
				}
				
				var shown_imgs = [];
				
				var html = '';
				var slides = [];
				
				$('#poip_images img').each(function(){
					if ( $.inArray($(this).attr('data-large'), images) != -1 && $.inArray($(this).attr('data-large'), shown_imgs) == -1 ) {
					
						html+= poip_outerHTML($(this).parent());
						flexslider.addSlide( $(this).parent().clone() );
						shown_imgs.push( $(this).attr('data-large') );
						
						if ( $('#poip_slider a[href="'+$(this).attr('data-large')+'"]').length ) {
							flexslider2.addSlide( '<li>'+poip_outerHTML($('#poip_slider a[href="'+$(this).attr('data-large')+'"]'))+'</li>' );
						}
					}
				});
				
				flexslider2.doMath();
				flexslider2.currentSlide = 1;
				$('#slider').flexslider(0);
				
				$('#carousel img').click(function(){
					var img = $(this).attr('data-large');
					var cnt = 0;
					$('#slider li a').each(function(){
						if ( $(this).attr('href') == img ) {
							return false;
						}
						cnt++
					});
					
					$('#slider').flexslider(cnt);
					
				});
				
				
				$.removeData($(".jqzoom"), 'elevateZoom');
				$('.zoomContainer').remove();
				
				var device_view = 'window';
				if(($(window).width()/$('.thumbnail  .img-responsive').width()) < 2 ) {
					device_view = 'inner';
				}
				var mmos_zoom_config = { 
					gallery: curent_id,
							cursor: 'pointer',
							imageCrossfade: true,
							zoomType: device_view,
							zoomWindowFadeIn: 500,
							zoomWindowFadeOut: 750,
					scrollZoom : true,
							responsive : true,
							zoomWindowWidth: 500 ,
							zoomWindowHeight: 500 ,
							borderSize : 0 ,
							borderColour : "#ffffff"
				};
				
				$("#slider li").css('z-index', 1);
				$("#slider li").css('opacity', 0);
				
				$("#slider .jqzoom").elevateZoom(mmos_zoom_config);
				
				$("#slider a[rel^='prettyPhoto']").prettyPhoto({
					animation_speed: 'normal',
					slideshow: 5000 ,
					autoplay_slideshow: 1 ,
					opacity: 0.8 ,
					show_title: 1 ,
					allow_resize: 1 ,
					default_width: 800 ,
					default_height: 927 ,
					counter_separator_label: '/',
					theme: 'light_rounded',
					modal: false,
					overlay_gallery: true,
				}); 
		
				poip_set_visible_images_timeout_id = false;
				
				if (poip_settings['img_hover']) {
					$("#carousel li img").mouseover(function(){
						$(this).click();
					});
				}
				
			}
			
			function poip_set_visible_images_OPC080184(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 100) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
				
				if ( !$('#poip_images').length ) {
					$('#carousel').before('<div id="poip_images" style="display:none;"></div>');
					var added_img = [];
					$('#carousel li').each(function(){
						if ( $.inArray($(this).find('img').attr('data-large'), added_img) == -1 ) {
							$('#poip_images').append( $(this).clone() );
							added_img.push($(this).find('img').attr('data-large'));
						}
					});
				}
				
				// second hidden list
				if ( !$('#poip_slider').length ) {
					$('#slider').before('<div id="poip_slider" style="display:none;"></div>');
					var added_img = [];
					$('#slider li').each(function(){
						if ( $.inArray($(this).find('a').attr('href'), added_img) == -1 ) {
							$('#poip_slider').append( $(this).clone() );
							added_img.push($(this).find('a').attr('href'));
						}
					});
				}
				
				if ( !$('#carousel .flex-viewport').length ) {
					poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_OPC080184(images, counter+1); }, 100);
					return;
				}
					
				var current_imgs = [];
				$('#carousel').find('img').each( function(){
					current_imgs.push($(this).attr('data-large'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
				
				var flexslider = $('#carousel').data('flexslider');
				var elems_cnt = flexslider.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider.removeSlide(i);
					$('#carousel .flex-viewport li:first').remove();
				}
				
				var flexslider2 = $('#slider').data('flexslider');
				var elems_cnt = flexslider2.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider2.removeSlide(i);
					$('#slider li:first').remove();
				}
				
				var shown_imgs = [];
				
				var html = '';
				var slides = [];
				
				$('#poip_images img').each(function(){
					if ( $.inArray($(this).attr('data-large'), images) != -1 && $.inArray($(this).attr('data-large'), shown_imgs) == -1 ) {
					
						html+= poip_outerHTML($(this).parent());
						flexslider.addSlide( $(this).parent().clone() );
						shown_imgs.push( $(this).attr('data-large') );
						
						if ( $('#poip_slider a[href="'+$(this).attr('data-large')+'"]').length ) {
							flexslider2.addSlide( '<li>'+poip_outerHTML($('#poip_slider a[href="'+$(this).attr('data-large')+'"]'))+'</li>' );
						}
					}
				});
				
				flexslider2.doMath();
				flexslider2.currentSlide = 1;
				$('#slider').flexslider(0);
				
				$('#carousel img').click(function(){
					var img = $(this).attr('data-large');
					var cnt = 0;
					$('#slider li a').each(function(){
						if ( $(this).attr('href') == img ) {
							return false;
						}
						cnt++
					});
					
					$('#slider').flexslider(cnt);
					
				});
				
				
				$.removeData($(".jqzoom"), 'elevateZoom');
				$('.zoomContainer').remove();
				
				var device_view = 'window';
				if(($(window).width()/$('.thumbnail  .img-responsive').width()) < 2 ) {
					device_view = 'inner';
				}
				var mmos_zoom_config = { 
					gallery: curent_id,
							cursor: 'pointer',
							imageCrossfade: true,
							zoomType: device_view,
							zoomWindowFadeIn: 500,
							zoomWindowFadeOut: 750,
					scrollZoom : true,
							responsive : true,
							zoomWindowWidth: 500 ,
							zoomWindowHeight: 500 ,
							borderSize : 0 ,
							borderColour : "#ffffff"
				};
				$("#slider .jqzoom").elevateZoom(mmos_zoom_config);
				
				$("#slider a[rel^='prettyPhoto']").prettyPhoto({
					animation_speed: 'normal',
					slideshow: 5000 ,
					autoplay_slideshow: 1 ,
					opacity: 0.8 ,
					show_title: 0 ,
					allow_resize: 1 ,
					default_width: 600 ,
					default_height: 800 ,
					counter_separator_label: '/',
					theme: 'light_rounded',
					modal: false,
					overlay_gallery: true,
				}); 
		
				//$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
				poip_set_visible_images_timeout_id = false;
				
			}
			
			function poip_set_visible_images_OPC080186(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 100) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
			
				if ( $('.image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('.image-additional').before('<div id="poip_images" style="display:none;"></div>');
						var added_img = [];
						$('.image-additional a').each(function(){
							//$('#poip_images').append( $(this).parent().parent().clone() );
							if ( $.inArray($(this).attr('href'), added_img) == -1 ) {
								$('#poip_images').append( $(this).clone() );
								added_img.push($(this).attr('href'));
							}
						});
					}
					
					
					if ( !$('.image-additional .slider-wrapper').length ) {
						poip_set_visible_images_timeout_id = poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_OPC080186(images, counter+1); }, 100);
						return;
					}

					
					var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							//html += ''+ poip_outerHTML($(this).parent().parent()) +'';
							html += '<div class="slider-item"><div class="product-block">'+ poip_outerHTML($(this)) +'</div></div>';
							
							shown_imgs.push( $(this).attr('href') );
							
						}
					});
					
					/*
					$.removeData($("#cloud-zoom"), 'elevateZoom');
					$('.zoomContainer').remove();
					*/
					
					$('.image-additional').html(html);

					
					/*
					$("#cloud-zoom").elevateZoom({gallery:'additional-carousel',  cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true, loadingIcon: 'catalog/view/theme/OPC070159/image/megnor/spinner.gif'});
					$("#cloud-zoom").bind("click", function(e) {
						var ez =   $('#cloud-zoom').data('elevateZoom');
						$.fancybox(ez.getGalleryList());
						return false;
					});
					*/
					
					var myObject = 'additional';
					if(widthClassOptions[myObject])
						var myDefClass = widthClassOptions[myObject];
					else
						var myDefClass= 'grid_default_width';
					
					var slider = $("#additional-carousel");
					slider.sliderCarousel({
						defWidthClss : myDefClass,
						subElement   : '.slider-item',
						subClass     : 'product-block',
						firstClass   : 'first_item_tm',
						lastClass    : 'last_item_tm',
						slideSpeed : 200,
						paginationSpeed : 800,
						autoPlay : false,
						stopOnHover : false,
						goToFirst : true,
						goToFirstSpeed : 1000,
						goToFirstNav : true,
						pagination : false,
						paginationNumbers: false,
						responsive: true,
						responsiveRefreshRate : 200,
						baseClass : "slider-carousel",
						theme : "slider-theme",
						autoHeight : true
					});
					
					if (poip_settings['img_hover']) {
						$('.image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}	
				poip_set_visible_images_timeout_id = false;
				
			}
			
			function poip_set_visible_images_OPC080189(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 100) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
			
				if ( $('.image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('.image-additional').before('<div id="poip_images" style="display:none;"></div>');
						var added_img = [];
						$('.image-additional a').each(function(){
							//$('#poip_images').append( $(this).parent().parent().clone() );
							if ( $.inArray($(this).attr('href'), added_img) == -1 ) {
								$('#poip_images').append( $(this).clone() );
								added_img.push($(this).attr('href'));
							}
						});
					}
					
					
					if ( !$('.image-additional .slider-wrapper').length ) {
						poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_OPC080189(images, counter+1); }, 100);
						return;
					}

					
					var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							//html += ''+ poip_outerHTML($(this).parent().parent()) +'';
							html += '<div class="slider-item"><div class="product-block">'+ poip_outerHTML($(this)) +'</div></div>';
							
							shown_imgs.push( $(this).attr('href') );
							
						}
					});
					
					
					$.removeData($("#cloud-zoom"), 'elevateZoom');
					$('.zoomContainer').remove();
					
					
					$('.image-additional').html(html);

					$("#tmzoom").elevateZoom({
				
						gallery:'additional-carousel',
						//inner zoom				 
										 
						zoomType : "inner", 
						cursor: "crosshair" 
						
						/*//tint
						
						tint:true, 
						tintColour:'#F90', 
						tintOpacity:0.5
						
						//lens zoom
						
						zoomType : "lens", 
						lensShape : "round", 
						lensSize : 200 
						
						//Mousewheel zoom
						
						scrollZoom : true*/
						
						
					});
					
					/*
					$("#cloud-zoom").elevateZoom({gallery:'additional-carousel',  cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true, loadingIcon: 'catalog/view/theme/OPC070159/image/megnor/spinner.gif'});
					$("#cloud-zoom").bind("click", function(e) {
						var ez =   $('#cloud-zoom').data('elevateZoom');
						$.fancybox(ez.getGalleryList());
						return false;
					});
					*/
					
					var myObject = 'additional';
					if(widthClassOptions[myObject])
						var myDefClass = widthClassOptions[myObject];
					else
						var myDefClass= 'grid_default_width';
					
					var slider = $("#additional-carousel");
					slider.sliderCarousel({
						defWidthClss : myDefClass,
						subElement   : '.slider-item',
						subClass     : 'product-block',
						firstClass   : 'first_item_tm',
						lastClass    : 'last_item_tm',
						slideSpeed : 200,
						paginationSpeed : 800,
						autoPlay : false,
						stopOnHover : false,
						goToFirst : true,
						goToFirstSpeed : 1000,
						goToFirstNav : true,
						pagination : false,
						paginationNumbers: false,
						responsive: true,
						responsiveRefreshRate : 200,
						baseClass : "slider-carousel",
						theme : "slider-theme",
						autoHeight : true
					});
					
					if (poip_settings['img_hover']) {
						$('.image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}	
				poip_set_visible_images_timeout_id = false;
				
			}
      
      function poip_set_visible_images_OPC080190(images, counter) { //2016/03/18
			
        clearTimeout(poip_set_visible_images_timeout_id);
				if (!counter) counter = 1;
				if (counter == 100) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
			
				if ( $('.image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('.image-additional').before('<div id="poip_images" style="display:none;"></div>');
						var added_img = [];
						$('.image-additional a').each(function(){
							//$('#poip_images').append( $(this).parent().parent().clone() );
							if ( $.inArray($(this).attr('href'), added_img) == -1 ) {
								$('#poip_images').append( $(this).clone() );
								added_img.push($(this).attr('href'));
							}
						});
					}
					
					if ( poip_svi_first_call ) {
            if ( !$('.image-additional .slider-wrapper').length ) {
              poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_OPC080190(images, counter+1); }, 100);
              return;
            }
            poip_svi_first_call = false;
          }
					
					var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							//html += ''+ poip_outerHTML($(this).parent().parent()) +'';
							html += '<div class="slider-item"><div class="product-block">'+ poip_outerHTML($(this)) +'</div></div>';
							
							shown_imgs.push( $(this).attr('href') );
							
						}
					});
					
					
					//$.removeData($("#cloud-zoom"), 'elevateZoom');
					//$('.zoomContainer').remove();
					
					
					$('.image-additional').html(html);

          /*
					$("#tmzoom").elevateZoom({
						gallery:'additional-carousel',
						//inner zoom				 
										 
						zoomType : "inner", 
						cursor: "crosshair" 
					});
          */
					
					/*
					$("#cloud-zoom").elevateZoom({gallery:'additional-carousel',  cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true, loadingIcon: 'catalog/view/theme/OPC070159/image/megnor/spinner.gif'});
					$("#cloud-zoom").bind("click", function(e) {
						var ez =   $('#cloud-zoom').data('elevateZoom');
						$.fancybox(ez.getGalleryList());
						return false;
					});
					*/
					
					var myObject = 'additional';
					if(widthClassOptions[myObject])
						var myDefClass = widthClassOptions[myObject];
					else
						var myDefClass= 'grid_default_width';
					
					var slider = $("#additional-carousel");
					slider.sliderCarousel({
						defWidthClss : myDefClass,
						subElement   : '.slider-item',
						subClass     : 'product-block',
						firstClass   : 'first_item_tm',
						lastClass    : 'last_item_tm',
						slideSpeed : 200,
						paginationSpeed : 800,
						autoPlay : false,
						stopOnHover : false,
						goToFirst : true,
						goToFirstSpeed : 1000,
						goToFirstNav : true,
						pagination : true,
						paginationNumbers: false,
						responsive: true,
						responsiveRefreshRate : 200,
						baseClass : "slider-carousel",
						theme : "slider-theme",
						autoHeight : true
					});
					
					if (poip_settings['img_hover']) {
						$('.image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}	
				poip_set_visible_images_timeout_id = false;
				
			}
      
      function poip_set_visible_images_OPC070162(images, counter) { // Lookz
			
				if (!counter) counter = 1;
				if (counter == 100) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
			
				if ( $('#additional-carousel').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#additional-carousel').before('<div id="poip_images" style="display:none;"></div>');
						var added_img = [];
						$('#additional-carousel a').each(function(){
							//$('#poip_images').append( $(this).parent().parent().clone() );
							if ( $.inArray($(this).attr('href'), added_img) == -1 ) {
								$('#poip_images').append( $(this).clone() );
								added_img.push($(this).attr('href'));
							}
						});
					}
					
					
					if ( !$('#additional-carousel .slider-wrapper').length ) {
						poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_OPC070162(images, counter+1); }, 100);
						return;
					}

					
					var current_imgs = [];
					$('#additional-carousel a').each( function(){
						current_imgs.push($(this).attr('href'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							//html += ''+ poip_outerHTML($(this).parent().parent()) +'';
							html += '<div class="slider-item"><div class="product-block">'+ poip_outerHTML($(this)) +'</div></div>';
							
							shown_imgs.push( $(this).attr('href') );
							
						}
					});
					
					
					$.removeData($("#cloud-zoom"), 'elevateZoom');
					$('.zoomContainer').remove();
					
					
					$('#additional-carousel').html(html);

          /*
					$("#tmzoom").elevateZoom({
				
						gallery:'additional-carousel',
						//inner zoom				 
										 
						zoomType : "inner", 
						cursor: "crosshair" 
						
					});
          */
					
					/*
					$("#cloud-zoom").elevateZoom({gallery:'additional-carousel',  cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true, loadingIcon: 'catalog/view/theme/OPC070159/image/megnor/spinner.gif'});
					$("#cloud-zoom").bind("click", function(e) {
						var ez =   $('#cloud-zoom').data('elevateZoom');
						$.fancybox(ez.getGalleryList());
						return false;
					});
					*/
          
          
          
          var myObject = 'additional';
          if(widthClassOptions[myObject])
            var myDefClass = widthClassOptions[myObject];
          else
            var myDefClass= 'grid_default_width';
          var slider = $("#additional-carousel");
          slider.sliderCarousel({
            defWidthClss : myDefClass,
            subElement   : '.slider-item',
            subClass     : 'product-block',
            firstClass   : 'first_item_tm',
            lastClass    : 'last_item_tm',
            slideSpeed : 200,
            paginationSpeed : 800,
            autoPlay : false,
            stopOnHover : false,
            goToFirst : true,
            goToFirstSpeed : 1000,
            goToFirstNav : true,
            pagination : true,
            paginationNumbers: false,
            responsive: true,
            responsiveRefreshRate : 200,
            baseClass : "slider-carousel",
            theme : "slider-theme",
            autoHeight : true
          });
          
          /*
          var nextButton = $(this).parent().find('.next');
          var prevButton = $(this).parent().find('.prev');
          nextButton.click(function(){
            slider.trigger('slider.next');
          })
          prevButton.click(function(){
            slider.trigger('slider.prev');
          })
          */
					
					
					if (poip_settings['img_hover']) {
						$('#additional-carousel a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}	
				poip_set_visible_images_timeout_id = false;
				
			}
			
			function poip_set_visible_images_maxstore(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
				
				if ( !$('#poip_images').length ) {
					$('div.image-additional').before('<div id="poip_images" style="display:none;"></div>');
					$('div.image-additional li').each(function(){
						$('#poip_images').append( $(this).clone() );
						//$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				if ( !$('div.image-additional .flex-viewport').length ) {
					setTimeout(function(){ poip_set_visible_images_maxstore(images, counter+1); }, 100);
					return;
				}
				
				var current_imgs = [];
				$('div.image-additional').find('a').each( function(){
					current_imgs.push($(this).attr('href'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
				
				
				var flexslider = $('.image-additional').data('flexslider');
				
				var elems_cnt = flexslider.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider.removeSlide(i);
					$('div.image-additional .flex-viewport li:first').remove();
				}
				
				var shown_imgs = [];
				$('#poip_images a').each(function(){
				
					if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
						flexslider.addSlide( $(this).parent().clone() );
						//flexslider.addSlide( poip_outerHTML($(this).parent()) );
						
						shown_imgs.push( $(this).attr('href') );
					}
				});
				
				$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
				
			}
			
			function poip_set_visible_images_allure(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
				
				if ( !$('#poip_images').length ) {
					$('div.image-additional').before('<div id="poip_images" style="display:none;"></div>');
					$('div.image-additional li').each(function(){
						$('#poip_images').append( $(this).clone() );
						//$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				if ( !$('div.image-additional .flex-viewport').length ) {
					setTimeout(function(){ poip_set_visible_images_allure(images, counter+1); }, 100);
					return;
				}
					
				var current_imgs = [];
				$('div.image-additional').find('a').each( function(){
					current_imgs.push($(this).attr('href'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
				
				
				var flexslider = $('.image-additional').data('flexslider');
				
				var elems_cnt = flexslider.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider.removeSlide(i);
					$('div.image-additional .flex-viewport li:first').remove();
				}
				
				var shown_imgs = [];
				$('#poip_images a').each(function(){
					if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
						flexslider.addSlide( $(this).parent().clone() );
						//flexslider.addSlide( poip_outerHTML($(this).parent()) );
						shown_imgs.push( $(this).attr('href') );
					}
				});
				
				$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
				
			}
			
			function poip_set_visible_images_buyshop(images, counter) {
				
				if (!counter) counter = 1;
				if (counter == 50) return;
				
				if ( !$('#poip_images').length ) {
					$('div.product-more-views').before('<div id="poip_images" style="display:none;"></div>');
					$('div.product-more-views li').each(function(){
						$('#poip_images').append( $(this).clone() );
						//$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				if ( !$('div.jcarousel-container').length ) {
					setTimeout(function(){ poip_set_visible_images_buyshop(images, counter+1); }, 100);
					return;
				}
				
				var current_imgs = [];
				$('div.product-more-views ul li').find('img').each( function(){
					current_imgs.push($(this).attr('src'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
          poip_set_visible_images_timeout_id = false;
					return; // nothing to change
				}
				
				
				$('div.product-more-views').html('<ul class="jcarousel jcarousel-skin-previews"></ul>');
				
				var shown_imgs = [];
				$('#poip_images img').each(function(){
					if ( $.inArray($(this).attr('src'), images) != -1 && $.inArray($(this).attr('src'), shown_imgs) == -1 ) {
						$('div.product-more-views ul').append( $(this).parent().clone() );
						shown_imgs.push( $(this).attr('src') );
					}
				});
				
				var elevateZoom = $(".elevate-zoom img.elevatezoom");
				var imageCloudZoom = $('.product-image img.cloudzoom');
				
				if (elevateZoom.length) {
					var PreviewSliderHeight = function () {
						var big_image_height = elevateZoom.height();
						var preview_image_height = $(".elevate-gallery").find('li:first-child').height();
						var slider_height = Math.round(big_image_height / preview_image_height) * preview_image_height;
						$(".jcarousel-skin-previews").find('.jcarousel-clip-vertical').css({
								"min-height": slider_height + "px"
						});
					};
				} else if (imageCloudZoom.length) {
				
					var cloudGalleryOuter = $('.product-more-views:not(.elevate-gallery) ul');
				
					var PreviewSliderHeight = function () {
            var big_image_height = imageCloudZoom.height();
            var preview_image_height = cloudGalleryOuter.find('li:first-child').height();
            var slider_height = Math.round(big_image_height / preview_image_height) * preview_image_height;
            //console.log(big_image_height);
            //console.log(slider_height);
            $(".jcarousel-skin-previews").find('.jcarousel-clip-vertical').css({
                "min-height": slider_height + "px"
            });
					};
				}
				
				if (PreviewSliderHeight) {
				
					$('div.product-more-views ul').jcarousel({
						vertical: true,
						scroll: 3,
						buttonNextHTML: '<a class="btn"><i class="icon-up"></i></a>',
						buttonPrevHTML: '<a class="btn"><i class="icon-down"></i></a>',
						itemLoadCallback: PreviewSliderHeight
					});
					
					if ($('.cloudzoom-gallery').length) {
						$('.cloudzoom-gallery').CloudZoom();
					}
					
				}
				
				if (poip_settings['img_hover']) {
					$('div.product-more-views ul li img').mouseover(function(){
						poip_image_mouseover(this);
					});
				}
			}
			
			
			function poip_set_visible_images_art(images_param, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('#content .wrapper').length ) {
				
					// for thumbs
					if ( !$('#poip_images').length ) {
						var added_imgs = [];
						$('#content .wrapper').before('<div id="poip_images" style="display:none;"></div>');
						$('#content .wrapper img').each(function(){
						
							if ( $.inArray($(this).attr('src'), added_imgs) == -1 ) {
								$('#poip_images').append( $(this).clone() );
								added_imgs.push( $(this).attr('src') );
							}
						});
					}
					
					// for hidden big images
					if ( !$('#poip_images_zoom').length ) {
						var added_imgs = [];
						$('#content .single-product').before('<div id="poip_images_zoom" style="display:none;"></div>');
						$('#content .single-product img').each(function(){
						
							if ( $.inArray($(this).attr('src'), added_imgs) == -1 ) {
								$('#poip_images_zoom').append( $(this).clone() );
								added_imgs.push( $(this).attr('src') );
							}
						});
					}
					
					
					if ( !$('#content .wrapper .slick-list').length) {
						setTimeout(function(){
							poip_set_visible_images_art(images_param, counter+1); }
						, 100);
						return;
					}
					
					var images = []; // art theme uses thumbs
					
					for (var i in images_param) { // save original order
						if ( !images_param.hasOwnProperty(i) ) continue;
						
						for (var j in poip_images) {
							if ( !poip_images.hasOwnProperty(j) ) continue;
							
							if ( poip_images[j]['popup'] == images_param[i] ) {
								images.push(poip_images[j]['thumb']);
								break;
							}
						}
					}
					
					var current_imgs = [];
					$('#content .wrapper').find('img').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('src'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					// << change thumbs carousel
					
					var elems_cnt = $('#content .wrapper img').length;
					for (var i = 1; i<=elems_cnt; i++ ) {
						$('#content .wrapper .slick-slider').slick('removeSlide',0);
					}
					
					var shown_imgs = [];
					for (var i in images) {
						if ( !images.hasOwnProperty(i) ) continue;
					
						$('#poip_images img').each(function(){
							if ( $(this).attr('src') == images[i] && $.inArray($(this).attr('src'), shown_imgs) == -1 ) {
								$('#content .wrapper .slick-slider').slick('addSlide', '<div class="carousel-item">'+poip_outerHTML($(this))+'</div>' );
								shown_imgs.push( $(this).attr('src') );
								return false;
							}
						});
					}
					
					// >> change thumbs carousel
					
					
					// << change hidded zoom images carousel
					
					var elems_cnt = $('#content .single-product img').length;
					for (var i = 1; i<=elems_cnt; i++ ) {
						$('#content .single-product').slick('removeSlide',0);
					}
					
					var shown_imgs = [];
					for (var i in images) {
						if ( !images.hasOwnProperty(i) ) continue;
					
						$('#poip_images_zoom img').each(function(){
						
							if ( $(this).attr('src') == images[i] && $.inArray($(this).attr('src'), shown_imgs) == -1 ) {
								$('#content .single-product').slick('addSlide', '<div class="carousel-item">'+poip_outerHTML($(this))+'</div>' );
								
								shown_imgs.push( $(this).attr('src') );
								return false;
							}
						});
					}
					
					// >> change hidded zoom images carousel
					
					CloudZoom.quickStart();
					
					/*
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('#boss-image-additional-zoom li a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					*/
					
				}
			
			}
			
			function poip_set_visible_images_tt_petsyshop(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('.image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('.image-additional').before('<div id="poip_images" style="display:none;"></div>');
						$('.image-additional a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('.image-additional.owl-carousel').data('owlCarousel');
					
					if (!current_carousel || !$('.image-additional.owl-carousel .owl-item').length || !$('.zoomContainer').length ) {
						setTimeout(function(){ poip_set_visible_images_tt_petsyshop(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('data-zoom-image'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('data-zoom-image'), images) != -1 && $.inArray($(this).attr('data-zoom-image'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('data-zoom-image') );
							
						}
					});
					
					current_carousel.addItem(html);
					current_carousel.reinit();
					
					// elevateZoom destroy
					$.removeData($(".thumbnails-image img"), 'elevateZoom');
					$('.zoomContainer').remove();
					$(".thumbnails-image img").elevateZoom({
						zoomType : "inner",
						cursor: "crosshair",
						gallery:'gallery_01', 
						cursor: 'crosshair', 
						galleryActiveClass: "active", 
						imageCrossfade: true,
					});
					
					//$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('.image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}
				
			}
			
			function poip_set_visible_images_tt_optima_(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('.image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('.image-additional').before('<div id="poip_images" style="display:none;"></div>');
						$('.image-additional a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('.image-additional.owl-carousel').data('owlCarousel');
					
					if (!current_carousel || !$('.image-additional.owl-carousel .owl-item').length || !$('.zoomContainer').length ) {
						setTimeout(function(){ poip_set_visible_images_tt_optima_(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('data-zoom-image'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('data-zoom-image'), images) != -1 && $.inArray($(this).attr('data-zoom-image'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('data-zoom-image') );
							
						}
					});
					
					current_carousel.addItem(html);
					current_carousel.reinit();
					
					// elevateZoom destroy
					$.removeData($(".thumbnails-image img"), 'elevateZoom');
					$('.zoomContainer').remove();
					$(".thumbnails-image img").elevateZoom({
						zoomType : "window",
						cursor: "crosshair",
						gallery:'gallery_01', 
						cursor: 'crosshair', 
						galleryActiveClass: "active", 
						imageCrossfade: true,
						zoomWindowFadeIn: 500, 
						zoomWindowFadeOut: 500, 
						lensFadeIn: 500, 
						lensFadeOut: 500,
						zoomWindowHeight: 350,
						zoomWindowWidth: 350,
						borderSize: 1,
					});
					
					if (poip_settings['img_hover']) {
						$('.image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}
				
			}
			
			function poip_set_visible_images_tt_greek_(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('.image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('.image-additional').before('<div id="poip_images" style="display:none;"></div>');
						$('.image-additional a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('.image-additional.owl-carousel').data('owlCarousel');
					
					if (!current_carousel || !$('.image-additional.owl-carousel .owl-item').length || !$('.zoomContainer').length ) {
						setTimeout(function(){ poip_set_visible_images_tt_greek_(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('data-zoom-image'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
						return; // nothing to change
					}
					
					
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('data-zoom-image'), images) != -1 && $.inArray($(this).attr('data-zoom-image'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('data-zoom-image') );
							
						}
					});
					
					current_carousel.addItem(html);
					current_carousel.reinit();
					
					// elevateZoom destroy
					$.removeData($(".thumbnails-image img"), 'elevateZoom');
					$('.zoomContainer').remove();
					 $(".thumbnails-image img").elevateZoom({
						zoomType : "window",
						cursor: "crosshair",
						gallery:'gallery_01', 
						cursor: 'crosshair', 
						galleryActiveClass: "active", 
						imageCrossfade: true,
						zoomWindowFadeIn: 500, 
						zoomWindowFadeOut: 500, 
						lensFadeIn: 500, 
						lensFadeOut: 500,
						zoomWindowHeight: 350,
						zoomWindowWidth: 350,
						borderSize: 1,
					});
					
					//$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('.image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}
				
			}
      
      function poip_set_visible_images_opc1000(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
        
        var carousel_elem = $('.product-info .owl-carousel');
			
				if ( carousel_elem.length ) {
					
					if ( !$('#poip_images').length ) {
						carousel_elem.before('<div id="poip_images" style="display:none;"></div>');
						carousel_elem.find('a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = carousel_elem.data('owlCarousel');
					
					if (!current_carousel || !carousel_elem.find('.owl-item').length ) {
						setTimeout(function(){ poip_set_visible_images_opc1000(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					carousel_elem.find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
            
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('href') );
							
						}
					});
					
					current_carousel.addItem(html);
					current_carousel.reinit();
					
          /*
					// elevateZoom destroy
					$.removeData($(".thumbnails-image img"), 'elevateZoom');
					$('.zoomContainer').remove();
					 $(".thumbnails-image img").elevateZoom({
						zoomType : "window",
						cursor: "crosshair",
						gallery:'gallery_01', 
						cursor: 'crosshair', 
						galleryActiveClass: "active", 
						imageCrossfade: true,
						zoomWindowFadeIn: 500, 
						zoomWindowFadeOut: 500, 
						lensFadeIn: 500, 
						lensFadeOut: 500,
						zoomWindowHeight: 350,
						zoomWindowWidth: 350,
						borderSize: 1,
					});
					
					//$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('.image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
          */
					
				}
				
			}
      
      function poip_set_visible_images_moment(images, counter) { // 2016/02/24
      
        clearTimeout(poip_set_visible_images_timeout_id);
				if (!counter) counter = 1;
				if (counter == 50) {
          poip_set_visible_images_timeout_id = false;
          return;
        }
        
        var carousel_elem = $('#image-additional');
			
				if ( carousel_elem.length ) {
					
					if ( !$('#poip_images').length ) {
						carousel_elem.before('<div id="poip_images" style="display:none;"></div>');
						carousel_elem.find('a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = carousel_elem.data('owlCarousel');
					
					if (!current_carousel || !carousel_elem.find('.owl-item').length || !$('.zoomContainer').length || document.readyState != "complete" ) {
						poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_moment(images, counter+1); }, 100);
						return;
					}
          
					var current_imgs = [];
					carousel_elem.find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					// old version of owlCarousel used, only complete carousel replacing will work
          /*
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
          */
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
          // correct order of images
          for (var i in images) {
            if ( !images.hasOwnProperty(i) ) continue;
            
            var elem = $('#poip_images a[href="'+images[i]+'"]:first');
            if (elem.length) {
              html += '<div>'+ poip_outerHTML(elem) +'</div>';
            }
            
          }
          
          /*
					$('#poip_images a').each(function(){
            
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('href') );
							
						}
					});
          */
					
          carousel_elem.replaceWith('<div class="thumbnails__list-image owl-carousel" id="image-additional">'+html+'</div>');
					//current_carousel.addItem(html);
					//current_carousel.reinit();
          
          // get again after replacement
          carousel_elem = $('#image-additional');
          
          carousel_elem.owlCarousel({
            loop:true,
            margin:10,
            responsive:{
              0:{
                items:2
              },
              600:{
                items:3
              },
              1000:{
                items:5
              }
            }
          })
					
					// elevateZoom destroy
					$.removeData($('#main-image'), 'elevateZoom');
          $('.zoomContainer').remove();
          $('.thumbnails__big-image .zoomWrapper:first').replaceWith($('.thumbnails__big-image .zoomWrapper img'));
          
					if (Kuler.image_zoom_type == 'outer_cloud' || Kuler.image_zoom_type == 'inner_cloud') {
            var zoom_params = {
              cursor: 'pointer',
              galleryActiveClass: 'active',
              imageCrossfade: true,
              lensShape: Kuler.lens_zoom_shape == 'rounded' ? 'round' : 'square'
            };
        
            if (Kuler.image_zoom_type == 'outer_cloud') {
              zoom_params.zoomWindowWidth = Kuler.zoom_window_width;
              zoom_params.zoomWindowHeight = Kuler.zoom_window_height;
            }
        
            if (Kuler.image_zoom_type == 'inner_cloud') {
              zoom_params.zoomType = 'inner';
            }
        
            $("#main-image").elevateZoom(zoom_params);
          }
        
          if (Kuler.image_lightbox) {
            $("#main-image").unbind('click');
            $("#main-image").bind("click", function(e) {
              var $this = $(this);
        
              var items = [{
                src: $this.data('zoomImage') || this.src
              }];
              
              for (var i in images) {
                if ( !images.hasOwnProperty(i) ) continue;
                if (items[0].src != images[i]) {
                  items.push({
                    src: images[i]
                  });
                }
              }
              /*
              $('#image-additional .product-image-link').each(function () {
                if (items[0].src != this.href) {
                  items.push({
                    src: this.href
                  });
                }
              });
              */
        
              $.magnificPopup.open({
                items: items,
                gallery: {
                  enabled: true
                },
                type: 'image',
                mainClass: 'mfp-fade'
              });
        
              e.preventDefault();
            });
          }
					
					if (poip_settings['img_hover']) {
						carousel_elem.find('a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
          
					
				}
        
        poip_set_visible_images_timeout_id = false;
				
			}
      
      function poip_set_visible_images_sellegance(images, counter) { // 2016/02/25
      
        clearTimeout(poip_set_visible_images_timeout_id);
				if (!counter) counter = 1;
				if (counter == 50) {
          poip_set_visible_images_timeout_id = false;
          return;
        }
        
        var carousel_elem1 = $('#sync1');
        var carousel_elem2 = $('#sync2');
			
				if ( carousel_elem1.length && carousel_elem2.length ) {
        
          // main image
          if ( !$('#poip_main_image').length ) {
            carousel_elem1.before('<div id="poip_main_image" style="display:none;"></div>');
            $('#poip_main_image').append( $('#image').clone().removeAttr('id') );
          }
          
          // main image carousel
					if ( !$('#poip_images1').length ) {
						carousel_elem1.before('<div id="poip_images1" style="display:none;"></div>');
						carousel_elem1.find('a').each(function(){
              $('#poip_images1').append( $(this).clone() );
							//$('#poip_images1').append( $(this).clone().removeAttr('id') );
						});
					}
          // small images carousel
          if ( !$('#poip_images2').length ) {
						carousel_elem2.before('<div id="poip_images2" style="display:none;"></div>');
						carousel_elem2.find('img').each(function(){
							$('#poip_images2').append( $(this).clone() );
						});
					}
					
					var current_carousel1 = carousel_elem1.data('owlCarousel');
          var current_carousel2 = carousel_elem2.data('owlCarousel');
					
          if ( poip_svi_first_call ) {
            if ( document.readyState != "complete" || !current_carousel1 || !carousel_elem1.find('.owl-item').length || !current_carousel2 || !carousel_elem2.find('.owl-item').length ) {
              poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_sellegance(images, counter+1); }, 100);
              return;
            }
          }
          
					var current_imgs = [];
          var current_imgs2 = [];
					carousel_elem1.find('a').each( function(){
						current_imgs.push($(this).attr('href'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					// old version of owlCarousel used, only complete carousel replacing will work
          /*
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
          */
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html1 = '';
          html2 = '';
          // correct order of images
          var img_cnt = 0;
          for (var i in images) {
            if ( !images.hasOwnProperty(i) ) continue;
            
            var current_img = poip_get_image_by_src(images[i], 'popup');
            if ( current_img && current_img['main'] ) { // first carousel (main)
              img_cnt++;
              
              $('#poip_main_image img').attr('src', current_img['main']); // main image src set
              
              var elem1 = $('#poip_images1 a[href="'+current_img['main']+'"], #poip_images1 a[href="'+current_img['popup']+'"]').first();
              if (elem1.length) {
                html1 += '<div class="item">'+ (img_cnt==1 ? poip_outerHTML($('#poip_main_image img').attr('id','image')) : '<img src="'+current_img['main']+'">') + poip_outerHTML(elem1) +'</div>';
              }
            }
            
            if ( current_img && current_img['thumb'] ) { // secong carousel (small thumbs, additional images upder main)
              var elem2 = $('#poip_images2 img[src="'+current_img['thumb']+'"]:first');
              if (elem2.length) {
                html2 += '<div class="item">'+ poip_outerHTML(elem2) +'</div>';
              }
            }
            
          }
          
          /*
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							shown_imgs.push( $(this).attr('href') );
						}
					});
          */
          
          carousel_elem1.replaceWith('<div id="sync1" class="owl-carousel">'+html1+'</div>');
          carousel_elem2.replaceWith('<div id="sync2" class="owl-carousel">'+html2+'</div>');
					//current_carousel.addItem(html);
					//current_carousel.reinit();
          
          // get again after replacement
          sync1 = $('#sync1');
          sync2 = $('#sync2');
          
          sync1.owlCarousel({
            singleItem : true,
            slideSpeed : 1000,
            navigation: true,
            navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
            pagination:false,
            afterAction : syncPosition,
            responsiveRefreshRate : 200,
          });
         
          sync2.owlCarousel({
            items : 5,
            itemsDesktop      : [1199,4],
            itemsDesktopSmall     : [979,3],
            itemsTablet       : [768,3],
            itemsMobile       : [479,3],
            pagination:false,
            navigation: true,
            navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
            responsiveRefreshRate : 100,
            afterInit : function(el){
              el.find(".owl-item").eq(0).addClass("synced");
            }
          });
          
          function syncPosition(el){
            var current = this.currentItem;
            $("#sync2")
              .find(".owl-item")
              .removeClass("synced")
              .eq(current)
              .addClass("synced")
            if($("#sync2").data("owlCarousel") !== undefined){
              center(current)
            }
          }
         
          $("#sync2").on("click", ".owl-item", function(e){
            e.preventDefault();
            var number = $(this).data("owlItem");
            sync1.trigger("owl.goTo",number);
          });
         
          function center(number){
            var sync2visible = sync2.data("owlCarousel").owl.visibleItems;
            var num = number;
            var found = false;
            for(var i in sync2visible){
              if(num === sync2visible[i]){
                var found = true;
              }
            }
         
            if(found===false){
              if(num>sync2visible[sync2visible.length-1]){
                sync2.trigger("owl.goTo", num - sync2visible.length+2)
              }else{
                if(num - 1 === -1){
                  num = 0;
                }
                sync2.trigger("owl.goTo", num);
              }
            } else if(num === sync2visible[sync2visible.length-1]){
              sync2.trigger("owl.goTo", sync2visible[1])
            } else if(num === sync2visible[0]){
              sync2.trigger("owl.goTo", num-1)
            }
            
          }
          
          $("#sync1 a[rel^='magnificPopup']").magnificPopup({
            type:'image',
            gallery:{
              enabled:true
            }
          });
					
					if (poip_settings['img_hover']) {
						sync2.find('img').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
				}
        
        poip_set_visible_images_timeout_id = false;
        poip_svi_first_call = false;
				
			}
      
      function poip_set_visible_images_goshop(images, counter) { // 2016/03/17
      
        clearTimeout(poip_set_visible_images_timeout_id);
				if (!counter) counter = 1;
				if (counter == 100) {
          poip_set_visible_images_timeout_id = false;
          return;
        }
        
        var carousel_selector = '.thumbnails-carousel';
        var carousel_elem = $(carousel_selector);
			
				if ( carousel_elem.length ) {
					
					if ( !$('#poip_images').length ) {
						carousel_elem.before('<div id="poip_images" style="display:none;"></div>');
						carousel_elem.find('a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = carousel_elem.data('owlCarousel');
					
          if ( poip_svi_first_call ) {
            if (!current_carousel || !carousel_elem.find('.owl-item').length || document.readyState != "complete" ) {
              poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_goshop(images, counter+1); }, 100);
              return;
            }
            poip_svi_first_call = false;
          }
          
					var current_imgs = [];
					carousel_elem.find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					// old version of owlCarousel used, only complete carousel replacing will work
          /*
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
          */
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
          // correct order of images
          for (var i in images) {
            if ( !images.hasOwnProperty(i) ) continue;
            var elem = $('#poip_images a[href="'+images[i]+'"]:first');
            if (elem.length) {
              html += '<div class="item">'+ poip_outerHTML(elem) +'</div>';
              //current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
            }
          }
					
          carousel_elem.replaceWith('<div class="thumbnails-carousel owl-carousel">'+html+'</div>');
					//current_carousel.addItem(html);
					//current_carousel.reinit();
          
          // get again after replacement
          carousel_elem = $(carousel_selector);
          
          carousel_elem.owlCarousel({
            autoPlay: 6000, //Set AutoPlay to 3 seconds
            navigation: true,
            navigationText: ['', ''],
            itemsCustom : [
              [0, 4],
              [450, 5],
              [550, 6],
              [768, 3],
              [1200, 3]
            ],
          });
          
          $('.thumbnails a, .thumbnails-carousel a').click(function() {
            var smallImage = $(this).attr('data-zoom-image');
            //var smallImage = $(this).attr('data-image');
            var largeImage = $(this).attr('data-zoom-image');
            var ez =   $('#image').data('elevateZoom');	
            $('#ex1').attr('href', largeImage);  
            ez.swaptheimage(smallImage, largeImage); 
            z_index = $(this).index('.thumbnails a, .thumbnails-carousel a');
            return false;
          });
					
					if (poip_settings['img_hover']) {
						carousel_elem.find('a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
				}
        
        poip_set_visible_images_timeout_id = false;
			}
      
      function poip_set_visible_images_sstore(images, counter) { // 2016/03/19
      
        clearTimeout(poip_set_visible_images_timeout_id);
				if (!counter) counter = 1;
				if (counter == 100) {
          poip_set_visible_images_timeout_id = false;
          return;
        }
        
        var carousel_selector = '.image-additional-carousel';
        var carousel_elem = $(carousel_selector);
			
				if ( carousel_elem.length ) {
					
					if ( !$('#poip_images').length ) {
						carousel_elem.before('<div id="poip_images" style="display:none;"></div>');
						carousel_elem.find('a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = carousel_elem.data('owlCarousel');
					
          if ( poip_svi_first_call ) {
            if (!current_carousel || !carousel_elem.find('.owl-item').length || document.readyState != "complete" ) {
              poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_sstore(images, counter+1); }, 100);
              return;
            }
            poip_svi_first_call = false;
          }
          
					var current_imgs = [];
					carousel_elem.find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					// old version of owlCarousel used, only complete carousel replacing will work
          /*
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
          */
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
          // correct order of images
          for (var i in images) {
            if ( !images.hasOwnProperty(i) ) continue;
            var elem = $('#poip_images a[href="'+images[i]+'"]:first');
            if (elem.length) {
              html += '<div>'+ poip_outerHTML(elem) +'</div>';
              //current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
            }
          }
					
          carousel_elem.replaceWith('<div class="image-additional-carousel thumbnails all-carousel">'+html+'</div>');
					//current_carousel.addItem(html);
					//current_carousel.reinit();
          
          // get again after replacement
          carousel_elem = $(carousel_selector);
          
          //data-index renum
          var index_cnt = 0;
          carousel_elem.find('a img').each(function(){
            
            $(this).attr('data-index', index_cnt);
            index_cnt++;
          });
          
          /*
          carousel_elem.owlCarousel({
            loop:false,
            autoplay:false,
            dots:false,
            nav:false,
            responsiveClass:true,
            responsive:{
                0:{
                    items:2,
                    nav:false
                },
                600:{
                    items:2,
                    nav:false
                },
                1000:{
                    items:4,
                    nav:false
                }
            }
          });
          */
          
          if ( images.length > 4 ) {
           carousel_elem.owlCarousel({
              loop:true,
              autoplay:false,
              dots:false,
              navText:["<",">"],
              margin: 10,
              responsiveClass:true,
              responsive:{
                0:{
                  items:2,
                  nav:true
                },
                600:{
                  items:2,
                  nav:true
                },
                1000:{
                  items:4,
                  nav:true
                }
              }
            });
          } else {
            carousel_elem.owlCarousel({
              loop:false,
              autoplay:false,
              dots:false,
              nav:false,
              responsiveClass:true,
              responsive:{
                0:{
                  items:2,
                  nav:false
                },
                600:{
                  items:2,
                  nav:false
                },
                1000:{
                  items:4,
                  nav:false
                }
              }
            });
          }
          
          
          var items2 = [];
          for ( var i in images ) {
            if ( !images.hasOwnProperty(i) ) continue;
            items2.push( {src: images[i] } );
          }
          
          $('.product-info .image-additional-carousel .dataitem').magnificPopup({
            mainClass: 'mfp-fade',
            items: items2,
            gallery: {
              enabled:true
            },
            type: 'image',
            callbacks : {
              open: function() {
                this.goTo(Number($(this.st.el).find('img').attr('data-index')));
                $('.magnify-lens').hide();
              }
            }
          });

          
          $('.product-info .thumbnails-one').replaceWith( poip_outerHTML($('.product-info .thumbnails-one')) );
          $('.product-info .thumbnails-one a').click(function(e){
            e.preventDefault();
            
            $('.product-info .image-additional-carousel div.owl-item:not(.cloned) .dataitem[href="'+$(this).attr('href')+'"]').click();
            
          });
          

          /*
          $('.product-info .thumbnails-one').magnificPopup({
            mainClass: 'mfp-fade',
            items: items2,
            gallery: {
              enabled:true
            },
            callbacks : {
              open: function() {
                $('.magnify-lens').hide();
              }
            },
            type: 'image'
          });
          */
          
					
					if (poip_settings['img_hover']) {
						carousel_elem.find('a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
				}
        
        poip_set_visible_images_timeout_id = false;
			}
      
      function poip_set_visible_images_mediacenter(images, counter) { // 2016/03/03
      
        clearTimeout(poip_set_visible_images_timeout_id);
				if (!counter) counter = 1;
				if (counter == 100) {
          poip_set_visible_images_timeout_id = false;
          return;
        }
        
        var carousel_selector = '.thumbnails-carousel';
        var carousel_elem = $(carousel_selector);
			
				if ( carousel_elem.length ) {
					
					if ( !$('#poip_images').length ) {
						carousel_elem.before('<div id="poip_images" style="display:none;"></div>');
						carousel_elem.find('a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = carousel_elem.data('owlCarousel');
					
          if ( poip_svi_first_call ) {
            if (!current_carousel || !carousel_elem.find('.owl-item').length || document.readyState != "complete" ) {
              poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_mediacenter(images, counter+1); }, 100);
              return;
            }
          }
          
					var current_imgs = [];
					carousel_elem.find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					// old version of owlCarousel used, only complete carousel replacing will work
          /*
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
          */
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
          // correct order of images
          for (var i in images) {
            if ( !images.hasOwnProperty(i) ) continue;
            
            var elem = $('#poip_images a[href="'+images[i]+'"]:first');
            if (elem.length) {
              html += '<div class="item">'+ poip_outerHTML(elem) +'</div>';
              //current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
            }
            
          }
          
					
          carousel_elem.replaceWith('<div class="thumbnails-carousel owl-carousel">'+html+'</div>');
					//current_carousel.addItem(html);
					//current_carousel.reinit();
          
          // get again after replacement
          carousel_elem = $(carousel_selector);
          
          carousel_elem.owlCarousel({
            autoPlay: 6000, //Set AutoPlay to 3 seconds
            navigation: true,
            navigationText: ['', ''],
            itemsCustom : [
              [0, 4],
              [450, 6],
              [550, 6],
              [768, 5],
              [1200, 6]
            ],
          });
					
					if (poip_settings['img_hover']) {
						carousel_elem.find('a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
          
					
				}
        
        poip_set_visible_images_timeout_id = false;
        poip_svi_first_call = false;
				
			}
      
      
      
      function poip_set_visible_images_so_shoppystore(images, counter) { // 2016/03/13
      
        clearTimeout(poip_set_visible_images_timeout_id);
				if (!counter) counter = 1;
				if (counter == 100) {
          poip_set_visible_images_timeout_id = false;
          return;
        }
        
        var carousel_selector = '#thumb-slider';
        var carousel_elem = $(carousel_selector);
			
				if ( carousel_elem.length ) {
					
					if ( !$('#poip_images').length ) {
						carousel_elem.before('<div id="poip_images" style="display:none;"></div>');
						carousel_elem.find('a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
          if ( poip_svi_first_call ) {
            if ( !carousel_elem.find('.lslide').length || document.readyState != "complete" ) {
              poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_so_shoppystore(images, counter+1); }, 100);
              return;
            }
          }
          
					var current_imgs = [];
					carousel_elem.find('a').each( function(){
						//if ( $.inArray($(this).attr('data-image'), current_imgs) == -1) {
							current_imgs.push($(this).attr('data-image'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					// lightSlider carousel, let's replace it completely
					
					var shown_imgs = [];
					
					html = '';
          // correct order of images
          for (var i in images) {
            if ( !images.hasOwnProperty(i) ) continue;
            
            var elem = $('#poip_images a[data-image="'+images[i]+'"]:first');
            if (elem.length) {
              html += '<li class="owl2-item">'+ poip_outerHTML(elem) +'</li>';
              //current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
            }
            
          }
          
          html = '<div id="thumb-slider" class="thumb-vertical-outer col-xs-3">'
            +'<div id="thumb-slider-next" class="slider-btn lSNext"><i class="fa fa-chevron-up"></i></div>'
            +'<ul class="thumb-vertical previews-list ">'
            +html
            +'</ul>'
						+'<div id="thumb-slider-prev" class="slider-btn lSPrev"><i class="fa fa-chevron-down"></i></div>'
            +'</div>';
					
          carousel_elem.replaceWith(html);
          // get again after replacement
          carousel_elem = $(carousel_selector);
          
          var a_cnt = 0;
          carousel_elem.find('li a').each(function(){
            $(this).attr('data-index', a_cnt);
            a_cnt++;
          });
          
					var thumbslider = carousel_elem.find('.thumb-vertical').lightSlider({
            item: 4,
            autoWidth: false,
            vertical:true,
            slideMargin: 0,
            verticalHeight:440,
                  pager: false,
            controls: false,
                  prevHtml: '<i class="fa fa-angle-up"></i>',
                  nextHtml: '<i class="fa fa-angle-down"></i>',
            responsive: [
              {
                breakpoint: 1199,
                settings: {
                  verticalHeight: 360,
                  item: 4,
                }
              },
              {
                breakpoint: 1024,
                settings: {
                  verticalHeight: 480,
                  item: 4,
                  
                }
              },
              {
                breakpoint: 768,
                settings: {
                  verticalHeight: 330,
                  item: 3,
                }
              }
            ]
          });
          
          //Call JQuery lightSlider - Go to previous slide
          if( images.length >= 4){
            $('#thumb-slider-prev').click(function(){
              thumbslider.goToPrevSlide();
            });
            $('#thumb-slider-next').click(function(){
              thumbslider.goToNextSlide();
            });
          }else{
            $('#thumb-slider .slider-btn').hide();
          }
          
          $("#thumb-slider .owl2-item").each(function() {
            $(this).find("[data-index='0']").addClass('active');
          });
          
          var mfp_items = [];
          for (var i in images) {
            if ( !images.hasOwnProperty(i) ) continue;
            mfp_items.push( {src: images[i] } );
          }
          
          // ZOOM
          <?php if (isset($soconfig_pages) && isset($soconfig_pages['product_enablezoom'] ) && $soconfig_pages['product_enablezoom'] == 1) { ?>
            
            var zoomCollection = '.large-image img';
            
            $.removeData(zoomCollection, 'elevateZoom');
            $.removeData(zoomCollection, 'zoomImage');
            $('.zoomContainer').remove();
            
            $( zoomCollection ).elevateZoom({
              <?php if( $soconfig_pages['product_zoommode'] != 'basic' ) { ?>
              zoomType        : "<?php echo isset($soconfig_pages['product_zoommode']) ? $soconfig_pages['product_zoommode'] : '';?>",
              <?php } ?>
              lensSize    :"<?php echo isset($soconfig_pages['product_zoomlenssize']) ? $soconfig_pages['product_zoomlenssize'] : '';?>",
              easing:true,
              
              gallery:'thumb-slider',
              cursor: 'pointer',
              galleryActiveClass: "active"
            });
            $('.large-image').magnificPopup({
              items: mfp_items,
              gallery: { enabled: true, preload: [0,2] },
              type: 'image',
              mainClass: 'mfp-fade',
              callbacks: {
                open: function() {
                  var activeIndex = parseInt($('#thumb-slider .img.active').attr('data-index'));
                  var magnificPopup = $.magnificPopup.instance;
                  magnificPopup.goTo(activeIndex);
                }
              }
            });
            
          <?php } else { ?>
          
            $('.owl2-item').magnificPopup({
              items: mfp_items,
              navText: ['',''],
              gallery: { enabled: true, preload: [0,2] },
              type: 'image',
              mainClass: 'mfp-fade',
              callbacks: {
                open: function() {
                  $cur = this.st.el;
                  var activeIndex = parseInt($('#thumb-slider .img.active').attr('data-index'));
                  var magnificPopup = $.magnificPopup.instance;
                  magnificPopup.goTo(activeIndex);
                }
              }
            });
      
          <?php } ?>
          
					
					if (poip_settings['img_hover']) {
						carousel_elem.find('a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
          
					
				}
        
        poip_set_visible_images_timeout_id = false;
        poip_svi_first_call = false;
				
			}
			
			function poip_set_visible_images_sebian(images, counter) { // by Novaworks
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('#image-additional-carousel').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#image-additional-carousel').before('<div id="poip_images" style="display:none;"></div>');
						$('#image-additional-carousel li.image-additional').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('#image-additional-carousel').data('owlCarousel');
					
					if (!current_carousel || !$('#image-additional-carousel .owl-item').length ) {
						setTimeout(function(){ poip_set_visible_images_sebian(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('#image-additional-carousel li.image-additional a').each( function(){
						current_imgs.push($(this).attr('href'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					// old version of owlCarousel used, only complete carousel replacing will work
					/*
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					*/
				
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += poip_outerHTML($(this).parent());
							//html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('href') );
							
						}
					});
					
					$('#image-additional-carousel').replaceWith('<div id="image-additional-carousel">'+html+'</div>');
					
					//$('#zoom1').replaceWith( poip_outerHTML($('#zoom1')) );
					
					if ( $('#zoom1').data('zoom') ) {
						$('#zoom1').data('zoom').destroy();
						$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					}
					
					$("#image-additional-carousel").owlCarousel({
						items : 5, //10 items above 1000px browser width
						itemsDesktop : [1000,4], //5 items between 1000px and 901px
						itemsDesktopSmall : [900,4], // 3 items betweem 900px and 601px
						itemsTablet: [600,3], //2 items between 600 and 0;
						itemsMobile : [320,1],
						navigation : true,
						pagination : false,
						slideSpeed : 600,
						navigationText : ["<i class=\"fa fa-angle-left\"></i>","<i class=\"fa fa-angle-right\"></i>"],
					});	
					
					/*
					current_carousel.addItem(html);
					current_carousel.reinit();
					*/
					
					if (poip_settings['img_hover']) {
						$('#image-additional-carousel .image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
					
				} else if ( $('#image-additional-carousel-quickview').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#image-additional-carousel-quickview').before('<div id="poip_images" style="display:none;"></div>');
						$('#image-additional-carousel-quickview li.image-additional').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('#image-additional-carousel-quickview').data('owlCarousel');
					
					if (!current_carousel || !$('#image-additional-carousel-quickview .owl-item').length ) {
						setTimeout(function(){ poip_set_visible_images_sebian(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('#image-additional-carousel-quickview li.image-additional a').each( function(){
						current_imgs.push($(this).attr('href'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					// old version of owlCarousel used, only complete carousel replacing will work
					
					
					/*
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					*/
				
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += poip_outerHTML($(this).parent());
							//html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('href') );
							
						}
					});
					
					$('#image-additional-carousel-quickview').replaceWith('<div id="image-additional-carousel-quickview">'+html+'</div>');
					
					//$('#zoom1').replaceWith( poip_outerHTML($('#zoom1')) );
					
					/*
					if ( $('#zoom1').data('zoom') ) {
						$('#zoom1').data('zoom').destroy();
						$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					}
					*/
					
					$("#image-additional-carousel-quickview").owlCarousel({
						items : 1,
						itemsDesktop : [1199,1],
						itemsDesktopSmall : [979,1],
						itemsTablet: [600,1], //2 items between 600 and 0;
						itemsMobile : [320,1],
						slideSpeed : 300,
						paginationSpeed : 300 
					});	
					
					/*
					current_carousel.addItem(html);
					current_carousel.reinit();
					*/
					
					/*
					if (poip_settings['img_hover']) {
						$('#image-additional-carousel-quickview .image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					*/
					
				}
				
				
			}
			
			
			function poip_set_visible_images_ranger(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('#image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#image-additional').before('<div id="poip_images" style="display:none;"></div>');
						$('#image-additional a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('#image-additional').data('owlCarousel');
					
					if (!current_carousel || !$('#image-additional .owl-item').length || !$('.zoomContainer').length ) {
						setTimeout(function(){ poip_set_visible_images_ranger(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						current_imgs.push($(this).attr('data-zoom-image'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
					
					/* old carousel version, only full carousel replacement works
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					*/
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('data-zoom-image'), images) != -1 && $.inArray($(this).attr('data-zoom-image'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('data-zoom-image') );
							
						}
					});
					
					$('#image-additional').replaceWith('<div class="thumbnails__list-image owl-carousel" id="image-additional">'+html+'</div>');
					
					$('.thumbnails__list-image').owlCarousel({
						loop:true,
						margin:10,
						responsive:{
						  0:{
							items:2
						  },
						  600:{
							items:3
						  },
						  1000:{
							items:5
						  }
						}
					})
					
					//current_carousel.addItem(html);
					//current_carousel.reinit();
					
					// elevateZoom destroy
					$.removeData($("#main-image"), 'elevateZoom');
					$.removeData($("#main-image"), 'zoomImage');
					//$('.zoomWrapper img.zoomed').unwrap();
					$('.zoomContainer').remove();
					
					if (Kuler.image_zoom_type == 'outer_cloud' || Kuler.image_zoom_type == 'inner_cloud') {
						var zoom_params = {
							cursor: 'pointer',
							galleryActiveClass: 'active',
							imageCrossfade: true,
							lensShape: Kuler.lens_zoom_shape == 'rounded' ? 'round' : 'square'
						};
				
						if (Kuler.image_zoom_type == 'outer_cloud') {
							zoom_params.zoomWindowWidth = Kuler.zoom_window_width;
							zoom_params.zoomWindowHeight = Kuler.zoom_window_height;
						}
				
						if (Kuler.image_zoom_type == 'inner_cloud') {
							zoom_params.zoomType = 'inner';
						}
				
						$("#main-image").elevateZoom(zoom_params);
					}
				
					$('#image-additional a').on('click', function (e) {
						e.preventDefault();
				
						var imagePath = $(this).data('zoomImage');
				
						$('#main-image')
							.attr('src', imagePath)
							.attr('data-zoom-image', imagePath)
							.data('zoomImage', imagePath)
							.data('elevateZoom').swaptheimage(imagePath, imagePath);
					});
				
					if (Kuler.image_lightbox) {
						$("#main-image").bind("click", function(e) {
							var $this = $(this);
				
							var items = [{
								src: $this.data('zoomImage') || this.src
							}];
				
							$('.product-image-link').each(function () {
								if (items[0].src != this.href) {
									items.push({
										src: this.href
									});
								}
							});
				
							$.magnificPopup.open({
								items: items,
								gallery: {
									enabled: true
								},
								type: 'image',
								mainClass: 'mfp-fade'
							});
				
							e.preventDefault();
						});
					}
					
					if (poip_settings['img_hover']) {
						$('#image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}
				
			}
      
      function poip_set_visible_images_pav_mode(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('#image-additional').length ) {
        
          // first time - copy all images to hidden element
          if ( !$('#poip_images').length ) {
          
            // count elements per item
            var images_per_item = Math.max(4, $('#image-additional').find('.item:first').find('a').length);
          
            $('#image-additional').before('<div id="poip_images" style="display:none;" data-images-per-item="'+images_per_item+'"></div>');
						$('#image-additional-carousel a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
          };
          
          var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						current_imgs.push($(this).attr('data-zoom-image'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
          
          // add visible images to carousel
          var pg_html = "";
          var shown_imgs = [];
          var anchors_cnt = 0;
          var images_per_item = $('#poip_images').attr('data-images-per-item');
          $('#poip_images a').each(function(){
            
            if ($.inArray( $(this).attr('data-zoom-image'), images) != -1 && $.inArray($(this).attr('data-zoom-image'), shown_imgs) == -1 ) {
            
              if (anchors_cnt%images_per_item==0) {
                if (anchors_cnt>0) pg_html = pg_html + "</div>";
                pg_html = pg_html + "<div class='item'>";
              }
            
              // show
              pg_html = pg_html + poip_outerHTML($(this));
              shown_imgs.push(this.href);
              
              anchors_cnt++;
            }
          });
          if (pg_html != "") {
            pg_html = pg_html + "</div>";
          }
          
          if (pg_html != $('#image-additional-carousel').html()) {
          
            $('#image-additional-carousel').html(pg_html);
            if ($('#image-additional-carousel').find('.item').length>1) {
              $('#image-additional').find(".carousel-control").show();
            } else {
              $('#image-additional').find(".carousel-control").hide();
            }
            
            $('#image-additional .item:first').addClass('active');
            
            /*
            
              var zoomCollection = '#image';
            
              $.removeData($(zoomCollection), 'elevateZoom');
              $('.zoomContainer').remove();
              
              $( zoomCollection ).elevateZoom({
                lensShape : "basic",
                lensSize    : 150,
                easing:true,
                gallery:'image-additional-carousel',
                cursor: 'pointer',
                galleryActiveClass: "active"
              });
            
            */
            
            if (poip_settings['img_hover']) {
              $('#image-additional-carousel a').click(function(event){
                event.preventDefault()
              });
              $('#image-additional-carousel a').mouseover(function(){
                poip_image_mouseover(this);
              });
            }
            
          }
        }
      }
			
      // pav_fashion renamed ?
      function poip_set_visible_images_fashion(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('#image-additional').length ) {
        
          // first time - copy all images to hidden element
          if ( !$('#poip_images').length ) {
          
            // count elements per item
            var images_per_item = Math.max(4, $('#image-additional').find('.item:first').find('a').length);
          
            $('#image-additional').before('<div id="poip_images" style="display:none;" data-images-per-item="'+images_per_item+'"></div>');
						$('#image-additional-carousel a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
          };
          
          var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						current_imgs.push($(this).attr('data-zoom-image'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
            poip_set_visible_images_timeout_id = false;
						return; // nothing to change
					}
          
          // add visible images to carousel
          var pg_html = "";
          var shown_imgs = [];
          var anchors_cnt = 0;
          var images_per_item = $('#poip_images').attr('data-images-per-item');
          $('#poip_images a').each(function(){
            
            if ($.inArray( $(this).attr('data-zoom-image'), images) != -1 && $.inArray($(this).attr('data-zoom-image'), shown_imgs) == -1 ) {
            
              if (anchors_cnt%images_per_item==0) {
                if (anchors_cnt>0) pg_html = pg_html + "</div>";
                pg_html = pg_html + "<div class='item'>";
              }
            
              // show
              pg_html = pg_html + poip_outerHTML($(this));
              shown_imgs.push(this.href);
              
              anchors_cnt++;
            }
          });
          if (pg_html != "") {
            pg_html = pg_html + "</div>";
          }
          
          if (pg_html != $('#image-additional-carousel').html()) {
          
            $('#image-additional-carousel').html(pg_html);
            if ($('#image-additional-carousel').find('.item').length>1) {
              $('#image-additional').find(".carousel-control").show();
            } else {
              $('#image-additional').find(".carousel-control").hide();
            }
            
            $('#image-additional .item:first').addClass('active');
            
             
            var zoomCollection = '#image';
          
            $.removeData($(zoomCollection), 'elevateZoom');
            $('.zoomContainer').remove();
            

            $( zoomCollection ).elevateZoom({
              lensShape : "basic",
              lensSize    : 150,
              easing:true,
              gallery:'image-additional-carousel',
              cursor: 'pointer',
              galleryActiveClass: "active"
            });
            
            if (poip_settings['img_hover']) {
              //$('#image-additional-carousel a').click(function(event){
              //  event.preventDefault()
              //});
              $('#image-additional-carousel a').mouseover(function(){
                poip_image_mouseover(this);
              });
            }
            
          }
        }
      }
      
      
      function poip_set_visible_images_fastor(images, counter) { // 2016/03/29 // simple
      
        var shown_img = [];
        poipImageAdditional().find('a').each( function(){
          if ( $.inArray( $(this).attr('href'), images) != -1 && $.inArray( $(this).attr('href'), shown_img) == -1) {
            $(this).closest('li').show();
            $(this).attr('data-poip-visible', true);
            shown_img.push($(this).attr('href'));
          } else {
            $(this).closest('li').hide();
            $(this).removeAttr('data-poip-visible');
          }
        });
        
        if ( $('.popup-gallery').data('magnificPopup') ) {
          $('.popup-gallery').data('magnificPopup').delegate = 'a.popup-image[data-poip-visible]';
        }
        
			}
      
      
      
      
      var poip_svi_first_call = true;
      
      // fn_svi
      function poip_set_visible_images(images_param) {
      
				var images = poip_sort_images_by_selected_options(images_param);
				
        if (poip_theme_name == 'opc1000') { // Fashion Store - OPC1000
					poip_set_visible_images_opc1000(images);
					return;
				}
        
        if (poip_theme_name == 'fastor') {
					poip_set_visible_images_fastor(images);
					return;
				}
        
        if (poip_theme_name == 'moment') { // 
					poip_set_visible_images_moment(images);
					return;
				}
        
        if (poip_theme_name == 'sstore') { // shopstore
					poip_set_visible_images_sstore(images);
					return;
				}
        
        if (poip_theme_name == 'mediacenter') { // 
					poip_set_visible_images_mediacenter(images);
					return;
				}
        
        if (poip_theme_name == 'goshop') { // 
					poip_set_visible_images_goshop(images);
					return;
				}
        
        if (poip_theme_name == 'sellegance') { // 
					poip_set_visible_images_sellegance(images);
					return;
				}
        
				if (poip_theme_name == 'sebian') {
					poip_set_visible_images_sebian(images);
					return;
				}
        
        if (poip_theme_name == 'fashion') {
					poip_set_visible_images_fashion(images);
					return;
				}
				
				if (poip_theme_name == 'stowear' || poip_theme_name == 'themegloballite') {
					poip_set_visible_images_stowear(images);
					return;
				}
        
        if (poip_theme_name == 'pav_mode') {
					poip_set_visible_images_pav_mode(images);
					return;
				}
				
				if (poip_theme_name == 'marketshop') {
					poip_set_visible_images_marketshop(images);
					return;
				}
				
				if (poip_theme_name == 'ranger') {
					poip_set_visible_images_ranger(images);
					return;
				}
				
				if (poip_theme_name == 'tt_petsyshop') {
					poip_set_visible_images_tt_petsyshop(images);
					return;
				}
				
				if (poip_theme_name.substr(0, 10) == 'tt_optima_') {
					poip_set_visible_images_tt_optima_(images);
					return;
				}
				
				if (poip_theme_name.substr(0, 9) == 'tt_greek_') {
					poip_set_visible_images_tt_greek_(images);
					return;
				}
        
        if (poip_theme_name.substr(0, 14) == 'so-shoppystore') {
					poip_set_visible_images_so_shoppystore(images);
					return;
				}
				
				if (poip_theme_name == 'buyshop') {
					poip_set_visible_images_buyshop(images);
					return;
				}
				
				if (poip_theme_name == 'OPC080183') { // Optimal
					poip_set_visible_images_OPC080183(images);
					return;
				}
				
				if (poip_theme_name == 'OPC080184') { // Kids Market
					poip_set_visible_images_OPC080184(images);
					return;
				}
				
				if (poip_theme_name.substr(0, 9) == 'OPC080186') { // Hair Salon
					poip_set_visible_images_OPC080186(images);
					return;
				}
				
				if (poip_theme_name.substr(0, 9) == 'OPC080189') { // Harvest
					poip_set_visible_images_OPC080189(images);
					return;
				}
        
        if (poip_theme_name.substr(0, 9) == 'OPC080190') { // Shine
					poip_set_visible_images_OPC080190(images);
					return;
				}
        
        if (poip_theme_name == 'OPC070162') { // Harvest
					poip_set_visible_images_OPC070162(images);
					return;
				}
				
				if (poip_theme_name == 'theme500') { // Cycling Equipment
					poip_set_visible_images_theme500(images);
					return;
				}
				
				if (poip_theme_name == 'theme533') { // Clothing for Everyone
					poip_set_visible_images_theme533(images);
					return;
				}
				
				if (poip_theme_name == 'theme541') { // Eyewear
					poip_set_visible_images_theme541(images);
					return;
				}
				
				if (poip_theme_name == 'theme546') { // 
					poip_set_visible_images_theme546(images);
					return;
				}
				
				if (poip_theme_name == 'theme560') { // 
					poip_set_visible_images_theme560(images);
					return;
				}
        
        if (poip_theme_name == 'theme563') { // 
					poip_set_visible_images_theme563(images);
					return;
				}
        
        if (poip_theme_name == 'theme573') { // 
					poip_set_visible_images_theme573(images);
					return;
				}
				
				if (poip_theme_name == 'theme593') {
					poip_set_visible_images_theme593(images);
					return;
				}
				
				if (poip_theme_name == 'theme638') {
					poip_set_visible_images_theme638(images);
					return;
				}
				
				if (poip_theme_name == 'art') {
					poip_set_visible_images_art(images);
					return;
				}
				
				if (poip_theme_name == 'bt_claudine' || poip_theme_name == 'ntl') { // bt_claudine
					poip_set_visible_images_bt_claudine(images);
					return;
				}
				
				if (poip_theme_name == 'bt_comohos' ) { 
					poip_set_visible_images_bt_comohos(images);
					return;
				}
        
        if (poip_theme_name == 'bt_superexpress' ) { 
					poip_set_visible_images_bt_superexpress(images);
					return;
				}
        
        if (poip_theme_name == 'bt_leather' ) { 
					poip_set_visible_images_bt_leather(images);
					return;
				}
        
        if (poip_theme_name == 'up-theme' ) { 
					poip_set_visible_images_up_theme(images);
					return;
				}
				
				if (poip_theme_name == 'allure') { 
					poip_set_visible_images_allure(images);
					return;
				}
				
				if (poip_theme_name == 'maxstore') { 
					poip_set_visible_images_maxstore(images);
					return;
				}
				
				// << DEFAULT OC 2.0 STYLE
				
				if ( $('li.image-additional').length || poip_theme_name == 'coloring' ) { // OC 2.0 default
					var shown_img = [];
					poipImageAdditional().find('a').each( function(){
						// Учтем возможность спец символов типа пробела %20
						if ( $.inArray( $(this).attr('href'), images) != -1 && $.inArray( $(this).attr('href'), shown_img) == -1) {
							$(this).show();
							shown_img.push($(this).attr('href'));
						} else {
							$(this).hide();
						}
					});
					
					return;
				}
				// >> DEFAULT OC 2.0 STYLE
				
				if (poip_theme_name == 'pavilion') {
					poip_set_visible_images_pavilion(images);
				}
				
				if (poip_theme_name == 'eagency') {
					poip_set_visible_images_eagency(images);
				}
				
        
				// << theme 422 compatibility
				if ($('div[class=image-additional]').find('ul[id=image-additional]').length) {
				
					// make inages list copy
					if ( !$('#image-additional-copy').length ) {
						$('div[class=image-additional]').after("<div id=\"image-additional-copy\" style=\"display: none;\">"+$('div[class=image-additional]').find('ul[id=image-additional]').html()+"</div>");
					}
					
					// check is image list update needed
					var new_html = '';
					var new_images = [];
					$('#image-additional-copy').find('a').each( function(){
						if ($.inArray( $(this).attr('data-image'), images) != -1 || $.inArray(decodeURIComponent($(this).attr('data-image')), images) != -1) {
							// anchors have parents = "li"
							new_html += "<li>"+$(this).parent().html()+"</li>";
							new_images.push($(this).attr('data-image'));
						}
						//else {
						//	$(this).hide();
						//}
					});
					
					// there may be double images, so make groupping
					var images_changed = $('#image-additional').find('a').length != new_images.length;
					var same_images_count = 0;
					if (!images_changed) {
						$('#image-additional').find('a').each( function(){
							if ($.inArray( $(this).attr('data-image'), images) != -1 || $.inArray(decodeURIComponent($(this).attr('data-image')), images) != -1) {
								same_images_count++;
							}
						});
						images_changed = same_images_count != new_images.length;
					}
					
					if (images_changed) {	
						
						$('div[class=image-additional]').html("<ul id=\"image-additional\">"+new_html+"</ul>");
						
						if ($('#image-additional').find('a').length) {
							setTimeout( function () {
								$('#image-additional').bxSlider({
									pager:false,
									controls:true,
									slideMargin:10,
									minSlides: 3,
									maxSlides: 3,
									slideWidth:70,
									infiniteLoop:false,
									moveSlides:1
								});
								
								$("#zoom_01").elevateZoom({gallery:'image-additional', cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true}); 
								//pass the images to Fancybox
								$("#zoom_01").bind("click", function(e) {  
									var ez =   $('#zoom_01').data('elevateZoom');	
									$.fancybox(ez.getGalleryList());
									return false;
								});
								
							}, 0);
						}
					}
					return;
				}
				// >> theme 422 compatibility
				
				// journal2 compatibility
				// if carousel journal2 -
				// first time - copy all to hidden div
				// second time - fill all from hidden div
				<?php if (isset($poip_theme_name)
					&& ($poip_theme_name == 'journal2' || $poip_theme_name == 'cosyone' || $poip_theme_name == 'ava_store' || $poip_theme_name == 'mattimeo')) { ?>
				
					if (poip_theme_name == 'journal2') {
						var block_gallery = $("#product-gallery");
					} else if (poip_theme_name == 'ava_store') { 
						var block_gallery = $("#gallery div.owl-carousel");
					} else if (poip_theme_name == 'mattimeo') { 
						var block_gallery = $("#add-gallery");	
					} else { // cosyone
						var block_gallery = $("ul.image_carousel");
					}
				
					// first time - copy all images to hidden element
					if ( !$('#hidden-carousel').length ) {
						block_gallery.after("<div style='display:none' id='hidden-carousel'></div>");
						poipImageAdditional().find('a').each( function(){
							$('#hidden-carousel').append( poip_outerHTML($(this)) );
							//$('#hidden-carousel').append( poip_outerHTML($(this).parent()) );
						});
					}
					
					// add visible images to carousel
					var pg_html = "";
					var pg_added = [];
					$('#hidden-carousel').find('a').each( function(){
						
						var img_href = $(this).attr('href');
						if (poip_theme_name == 'mattimeo') {
							if ( (img_href == '#' || !img_href) && $(this).attr('data-zoom-image') ) img_href = $(this).attr('data-zoom-image');
						} else {
							if ( (img_href == '#' || !img_href) && $(this).attr('data-image') ) img_href = $(this).attr('data-image');
						}
						
						if ($.inArray( img_href, images) != -1 || $.inArray(decodeURIComponent(img_href), images) != -1) {
							if ($.inArray(img_href, pg_added) == -1) { // to not have double images
								// show
								pg_html = pg_html + poip_outerHTML($(this));
								pg_added.push(img_href);
								//pg_html = pg_html + poip_outerHTML($(this).parent());
							}
						}
					});
					
					
					
					// when carousel for additional images is turned on
					if (block_gallery.data('owlCarousel')) {
						var pg_opts = block_gallery.data('owlCarousel').options;
					}
					
					if (pg_html != block_gallery.html()) {
						block_gallery.html(pg_html);
						
						// when carousel for additional images is turned on
						if (block_gallery.data('owlCarousel')) {
							block_gallery.data('owlCarousel').reinit(pg_opts);
							
							<?php if (isset($poip_theme_name) && $poip_theme_name == "journal2" && isset($poip_journal2_settings)
								&& ($poip_journal2_settings['product_page_gallery_carousel_arrows'] == 'hover' || $poip_journal2_settings['product_page_gallery_carousel_arrows'] == 'always')): ?>
							block_gallery.find('.owl-buttons').addClass('side-buttons');
							<?php endif; ?>
						}
						
						// journal2 may use other gallery instead of colorbox
						<?php if (isset($poip_theme_name) && $poip_theme_name == "journal2") {
							if (isset($poip_journal2_settings) && $poip_journal2_settings['product_page_gallery'] === '1') { ?>
								var ig_added = [];
								
								// not used in quickview
								if (typeof(poip_journal2_quickview) == 'undefined' || !poip_journal2_quickview) {
								
									$('.product-info .image-gallery a').each(function(){
										// spec symbols like space %20
										
										if (($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) && $.inArray(this.href, ig_added) == -1) {
											// show
											$(this).attr('rel', 'poip-visible');
											//$(this).addClass('swipebox');
											ig_added.push(this.href);
										} else { // hide
											$(this).attr('rel', '');
											//$(this).removeClass('swipebox');
											//$(this).hide();
										}
										
									});
									
									// original click event in journal2 places later. fix it with mouseover
									$('.gallery-text').off('mousedown');
									$('.gallery-text').on('mousedown', function() {
										$('.gallery-text').off('click');
										$('.gallery-text').on('click', function () {
											if ( !$('#swipebox-overlay').length ) {
												$('.product-info .image-gallery a.swipebox[rel=poip-visible][href="'+$('#image').parent().attr('href')+'"]').first().click();
												return false;
											}
										});
									});
								}
							<?php } ?>
							
							/* additional images click */
							$('.product-info .image-additional a').click(function (e) {
									e.preventDefault();
									var thumb = $(this).find('img').attr('src');
									var image = $(this).attr('href');
									Journal.changeProductImage(thumb, image);
									return false;
							});
							
							//images_to_mouseover();
							if (poip_settings['img_hover']) {
								$('div.image-additional').find('a').mouseover(function(){
									poip_image_mouseover(this);
								});
							}
							
						<?php } ?>
						
						<?php if (isset($poip_theme_name) && $poip_theme_name == 'cosyone') { ?>
							$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
							
							//$(".cloud-zoom-gallery").last().removeClass("cboxElement");
						
							$(".cloud-zoom-gallery").click(function() {
								$("#zoom-btn").attr('href', $(this).attr('href'));
								$("#zoom-btn").attr('title', $(this).attr('title'));
							
							});
							
						<?php } ?>
						
						<?php if (isset($poip_theme_name) && $poip_theme_name == 'mattimeo' && $poip_mattimeo_settings['product_zoom'] == '1') { ?> // опциональная галерея вместо колорбокса
							
							$('.left .image').html($('.left .image').html());
							
							$('.image-additional a').click(function(){ 
								$('.image-additional a').removeClass('active');
								$(this).addClass('active'); // some calls changed, whats why one div should be deleted from carousel
								$('.product-info .image img').attr('src', $(this).attr('data-image'));
							});
							$('.image-additional a:first').addClass('active');
							// zoom
							// elevateZoom destroy
							$.removeData($("#main-image"), 'elevateZoom');
							$('.zoomContainer').remove();
							$("#main-image").elevateZoom({
								gallery:'add-gallery',  
								galleryActiveClass: 'active',
								zoomType: "inner",
								cursor: "pointer"
							});
							
							
							var mattimeo_data_index = 0;
							$('.image-additional a').each(function(){
								$(this).attr('data-index',mattimeo_data_index);
								mattimeo_data_index++;
							});
							
							
							var popupSettings = {items: []
																	,gallery: { enabled: true, preload: [0,2] }
																	,type: 'image'
																	,mainClass: 'mfp-fade'
																	};
							if ($('.image-additional div a').length) {
								popupSettings['callbacks'] = {
									open: function() {
										var activeIndex = parseInt($('.image-additional a.active').attr('data-index'));
										var magnificPopup = $.magnificPopup.instance;
										magnificPopup.goTo(activeIndex);
									}
								};
								
								$('.image-additional div a').each(function(){
									popupSettings['items'].push({src: $(this).attr('data-zoom-image')});
								});
								
							}
							
							$('.left .image a').magnificPopup(popupSettings);
							
						<?php } ?>
						
						<?php if (isset($poip_theme_name) && $poip_theme_name == 'ava_store') { ?>
								
							// elevateZoom destroy
							$.removeData($("#zoom"), 'elevateZoom');
							$('.zoomContainer').remove();
							
							$("#zoom").elevateZoom({
								gallery:'gallery',
								zoomType: "inner",
								cursor: "crosshair",
								galleryActiveClass: 'active',
								imageCrossfade: true,
								zoomWindowFadeIn: 500,
								zoomWindowFadeOut: 750,
								loadingIcon: 'catalog/view/theme/default/image/loader.gif'
							});
							
						<?php } ?>
						
						
						
					}
					
					return;
					
				<?php } ?>
				
				<?php
				// << pav fashion theme compatibility
				if (isset($poip_theme_name) && ($poip_theme_name == 'pav_fashion' || $poip_theme_name == 'pav_styleshop' || $poip_theme_name == 'megashop'
				|| $poip_theme_name == 'lexus_shopping' || $poip_theme_name == 'pav_sportshop' )) { ?>
					
					// first time - copy all images to hidden element
					if ( !$('#hidden-carousel').length ) {
					
						// count elements per item
						var images_per_item = Math.max(3, $('#image-additional').find('.item').first().find('a').length);
						
						$("#image-additional").after("<div style='display:none' id='hidden-carousel' images_per_item='"+images_per_item+"'></div>");
						
						$('#image-additional-carousel').find('a').each( function(){
							$('#hidden-carousel').append( poip_outerHTML($(this)) );
						});
					};
						
					// add visible images to carousel
					var pg_html = "";
					var pg_added = [];
					var anchors_cnt = 0;
					var images_per_item = $('#hidden-carousel').attr('images_per_item');
					$('#hidden-carousel').find('a').each( function(){
						
						if ($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) {
							if ($.inArray(this.href, pg_added) == -1) { 
							
								if (anchors_cnt%images_per_item==0) {
									if (anchors_cnt>0) pg_html = pg_html + "</div>";
									pg_html = pg_html + "<div class='item'>";
								}
							
								// show
								pg_html = pg_html + poip_outerHTML($(this));
								pg_added.push(this.href);
								//pg_html = pg_html + poip_outerHTML($(this).parent());
								
								anchors_cnt++;
							}
						}
					});
					if (pg_html != "") {
						pg_html = pg_html + "</div>";
					}
					
					if (pg_html != $('#image-additional-carousel').html()) {
					
						$('#image-additional-carousel').html(pg_html);
						if ($('#image-additional-carousel').find('.item').length>1) {
							$("#image-additional").find(".carousel-control").show();
						} else {
							$("#image-additional").find(".carousel-control").hide();
						}
						
						$('#image-additional .item:first').addClass('active');
						
						if (poip_theme_name == 'lexus_shopping' || (poip_theme_name == 'pav_sportshop' && !poip_settings['img_hover'] )
						|| (poip_theme_name == 'pav_fashion' && !poip_settings['img_hover'] )) {
						
							var zoomCollection = '#image';
						
							$.removeData($(zoomCollection), 'elevateZoom');
							$('.zoomContainer').remove();
							
							$( zoomCollection ).elevateZoom({
								lensShape : "basic",
								lensSize    : 150,
								easing:true,
								gallery:'image-additional-carousel',
								cursor: 'pointer',
								galleryActiveClass: "active"
							});
						}
						
						if (poip_settings['img_hover']) {
							$("#image-additional-carousel a").click(function(event){
								event.preventDefault()
							});
							$("#image-additional").find('a').mouseover(function(){
								poip_image_mouseover(this);
							});
						}
						
					}
					
					return;
				<?php } 
				// >> pav fashion theme compatibility
				?>
				
				<?php
				// << polianna theme compatibility
				if (isset($poip_theme_name) && $poip_theme_name == 'polianna') { ?>
				
					// make images list copy
					if ( !$('#image-additional-copy').length ) {
						$('div.image-additional').after("<div id=\"image-additional-copy\" style=\"display: none;\">"+$('div.image-additional div.overview').html()+"</div>");
					}
					
					var shown_img = [];
					var new_items = '';
					$('#image-additional-copy a').each(function(){
						if (($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) && $.inArray( this.href, shown_img) == -1) {
							new_items+= '<div class="item">'+poip_outerHTML($(this))+'</div>';
							shown_img.push(this.href);
						}
					});
					
					$('div.image-additional div.overview').html(new_items);
				
					$('.image-scroll').tinycarousel({ 
						axis: 'x', // vertical or horizontal scroller? ( x || y ).
						interval: true,
						rewind: false, 
					});
				
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
				
					return;
				<?php }
				// >> polianna theme compatibility
				?>
				
				// << lexus superstore compatibility
				if ($('div.image-additional').find('div.item').find('a').length) {
					var shown_img = [];
					$('div.image-additional').find('div.item').find('a').each( function(){
					
						if (($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) && $.inArray( this.href, shown_img) == -1) {
							$(this).show();
							shown_img.push(this.href);
						} else {
							$(this).hide();
							
						}
					});
					return;
				}
				// >> lexus superstore compatibility
				
				// << DEFAULT OC 1.X STYLE
				// more compatible
				
				var shown_img = [];
				poipImageAdditional().find('a').each( function(){
				
					var current_href = $(this).attr('href');
					if ( (!current_href || current_href == '#') ) {
						if ($(this).attr('data-zoom-image')) {
							current_href = $(this).attr('data-zoom-image');
						} else {
							current_href = false;
						}
						if (current_href) {
							if ( $.inArray( current_href, images) != -1 && $.inArray( current_href, shown_img) == -1 ) {
								$(this).show();
								shown_img.push(current_href);
							} else {
								$(this).hide();
							}
						}
					}
        });
				
				/* old
				var shown_img = [];
				$('div.image-additional').find('a').each( function(){
        //$('div.image-additional').children('a').each( function(){
          if (($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) && $.inArray( this.href, shown_img) == -1) {
            $(this).show();
						shown_img.push(this.href);
          } else {
            $(this).hide();
          }
        });
				*/
				// >> DEFAULT OC 1.X STYLE
				
				// << theme neocart
				if ( $('.product-img-box a.cloud-zoom-gallery').length ) {
					$('.product-img-box a.cloud-zoom-gallery').each(function () {
						if ($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) {
							$(this).parent().show(); // <li>
						} else {
							$(this).parent().hide();
						}
					});
					
					// switch to beginning
					if ($('.product-img-box .flex-direction-nav a.flex-prev').length) {
						for (var i=1; i<=50; i++) {
							$('.product-img-box .flex-direction-nav a.flex-prev').trigger('click');
						}
					}
					
				}
				// >> theme neocart
        
      }
      
      function elevate_zoom_direct_change(img_click, timeout) {
        
        if ( timeout ) {
          setTimeout(function(){
            $('.zoomContainer .zoomWindowContainer div').css({"background-image": 'url("'+img_click+'")'});
          }, timeout);
        } else {
          $('.zoomContainer .zoomWindowContainer div').css({"background-image": 'url("'+img_click+'")'});
        }
      }
      
      //goshop
      function poip_elevatezoom_swap(small_image, large_image) {
      
        var ez =   $('#image').data('elevateZoom');
        $('#ex1').attr('href', large_image);
        if ( ez ) {
          ez.swaptheimage(small_image, large_image);
        }
        
      }
      
			//
			function elevate_zoom_select_image(img_click) {
			
				var have_elevate_zoom = false;
				
				//$('#image-additional').find('li').find('a').each( function () {
				poipImageAdditional().find('a').each( function () {
					if ($(this).attr('data-image') == img_click || $(this).attr('data-zoom-image') == img_click) {
						have_elevate_zoom = true;
					}
				});
				
				if (have_elevate_zoom) {
			
					setTimeout( function() {
						poipImageAdditional().find('a').each( function () {
							if ($(this).attr('data-image') == img_click || $(this).attr('data-zoom-image') == img_click) {
								//$(this).find('img').click();
								$(this).click();
								return false;
							}
						});
						if ( poip_theme_name == 'stowear' || poip_theme_name == 'themegloballite' ) {
							stowear_refresh_popup();
						}
					}, 100);
				}
				return have_elevate_zoom;
			}
			
			function poip_cloud_zoom_click(img_click, elem_check_param, additional_images_param) {
					
        if ( typeof(elem_check_param) == 'undefined' && elem_check_param ) {
          elem = elem_param;
        } else {
          elem = $('#zoom1');
        }
        
        if ( typeof(additional_images_param) == 'undefined' && additional_images_param ) {
          additional_images = additional_images_param;
        } else {
          additional_images = $('.image-additional a[href]');
        }
          
				if ( elem.data('zoom') ) {
					setTimeout(function(){
					additional_images.each(function(){
						if ( img_click == $(this).attr('href') ) {
							$(this).click();
							return false;
						}
					});
					}, 200);
				}
					
			}
			
			// << theme lexus superstore & journal2
			function lexus_superstore_zoom_switch(img_click) {
				$('.image a #image').attr('data-zoom-image', img_click);
				$('.zoomWindowContainer').find('div').css({"background-image": 'url("'+img_click+'")'});
				if ($('.image a #image').data('zoom-image')) {
					$('.image a #image').data('zoom-image', img_click);
				}
			}
			// >> theme lexus superstore
			
			function pav_fashion_zoom_switch(img_click) {
			
				setTimeout(function(){
				
					$('div.image').find('#image').attr('data-zoom-image', img_click);
					$('.zoomWindowContainer').find('div').css({"background-image": 'url("'+img_click+'")'});
					if ($('div.zoomLens').css('background-image') != 'none') {
						$('div.zoomLens').css({"background-image": 'url("'+img_click+'")'});
					}
					if ($('div.image').find('#image').data('zoom-image')) {
						$('div.image').find('#image').data('zoom-image', img_click);
					}
				
				}, 100);
				
			}
			
			function stowear_refresh_popup() {
			
				$('#poip_popup').remove();
				$('#quickview_product .popup-gallery').append('<div id="poip_popup" style="display:none;"></div>');
				
				var added_imgs = [];
				$('#quickview_product .popup-gallery .thumbnails a:not([disabled])').each(function(){
					
					if ( $.inArray($(this).attr('href'), added_imgs) == -1 && $(this).attr('href') != $('#quickview_product .popup-gallery a#ex1').attr('href') ) {
						$('#poip_popup').append( $(this).clone() );
						added_imgs.push($(this).attr('href'));
					}
					
				});
			
				$('#quickview_product .popup-gallery').magnificPopup({
					delegate: 'a#ex1, #poip_popup a',
					type: 'image',
					tLoading: 'Loading image #%curr%...',
					mainClass: 'mfp-img-mobile',
					gallery: {
						enabled: true,
						navigateByImgClick: true,
						preload: [0,1] // Will preload 0 - before current, and 1 after the current image
					},
					image: {
						tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
						titleSrc: function(item) {
							return item.el.attr('title');
						}
					}
				});
				
				$('#quickview_product .popup-gallery .thumbnails a').off('click');
				$('#quickview_product .popup-gallery .thumbnails a').on('click', function(e){
					
					e.preventDefault();
					
					$('#poip_popup a[href="'+$(this).attr('href')+'"]').click();
					
				});
			
			}
      
      function poip_refresh_popup_mediacenter() {
			
        if ( $('#quickview_product .popup-gallery .thumbnails-carousel').length && !$('#quickview_product .popup-gallery .thumbnails-carousel').closest('html').is('.quickview') ) {
        
          $('#poip_popup').remove();
          $('#quickview_product').before('<div id="poip_popup" style="display:none;"></div>');
          
          var added_imgs = [];
          $('#quickview_product .popup-gallery .thumbnails-carousel a:not([disabled])').each(function(){
            
            if ( $.inArray($(this).attr('href'), added_imgs) == -1 ) {
              $('#poip_popup').append( $(this).clone() );
              added_imgs.push($(this).attr('href'));
            }
            
          });
        
          $('#poip_popup').magnificPopup({
            delegate: 'a.popup-image',
            type: 'image',
            tLoading: 'Loading image #%curr%...',
            mainClass: 'mfp-with-zoom',
            gallery: {
              enabled: true,
              navigateByImgClick: true,
              preload: [0,1] // Will preload 0 - before current, and 1 after the current image
            },
            image: {
              tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
              titleSrc: function(item) {
                return item.el.attr('title');
              }
            }
          });
          
          $('#quickview_product .popup-gallery a').off('click');
          $('#quickview_product .popup-gallery .thumbnails-carousel a, #ex1').off('click');
          $('#quickview_product .popup-gallery .thumbnails-carousel a, #ex1').on('click', function(e){
            
            e.preventDefault();
            e.stopPropagation();
            
            $('#poip_popup a[href="'+$(this).attr('href')+'"]').click();
            
          });
        }
			}
			
			function ava_store_zoom_switch(img_click) {
				
				$('div.product-info div.image a#zoom_link1').attr('href', img_click);
				$('.zoomWindowContainer').find('div').css({"background-image": 'url("'+img_click+'")'});
				if ($('.image a #image').data('zoom-image')) {
					$('.image a #image').data('zoom-image', img_click);
				}
				
			}
			
			function zoom_switch_sebian_cloud_zoom(img_click) {
				
				if ($('#zoom1').data('zoom')) {
					setTimeout(function(){
					$('#image-additional-carousel .image-additional a').each(function(){
						if ( img_click == $(this).attr('href') ) {
							$(this).click();
							return false;
						}
					});
					}, 0);
				}
				
			}
			
      var poip_image_zoom_click_timeout = false;
			function image_zoom_click(img_click, call_cnt) {
      
        if ( poip_image_zoom_click_timeout ) {
          clearTimeout(poip_image_zoom_click_timeout);
        }
      
				if ( document.readyState != "complete" ) {
          if ( typeof(call_cnt) == 'undefined' ) {
            call_cnt = 1;
          }  
          if ( call_cnt <= 100 ) {
            poip_image_zoom_click_timeout = setTimeout(function(){
              image_zoom_click(img_click, call_cnt+1)
            }, 100);
          }
					return;
				}
        
        
				<?php if ( $poip_theme_name == 'ranger' || $poip_theme_name == 'moment' ) { ?>
          // elevateZoom zoomContainer may be not created yet, it may give js css error, so let's wait
          // it may be useful for other themes with elevateZoom
					if ( !$('.zoomContainer').length ) {
						if ( typeof(call_cnt) == 'undefined' ) {
							call_cnt = 1;
						}
						if ( call_cnt < 100 ) {
							setTimeout(function(){
								image_zoom_click(img_click, call_cnt+1);
							},50);
							return;
						}
					}
				<?php } ?>
        
        <?php if ( $poip_theme_name == 'moment' ) { ?>
        
          $('#main-image').attr('data-zoom-image', img_click);
          $('#main-image').data('zoomImage', img_click);
        
          elevate_zoom_direct_change(img_click);
          return;
        <?php } ?>
        
        <?php if ( $poip_theme_name == 'up-theme' ) { ?>
        
          poip_cloud_zoom_click(img_click);
          return;
        <?php } ?>
        
        <?php if ( substr($poip_theme_name, 0, 14) == 'so-shoppystore' ) { ?>
        
          var main_image = poip_main_image();
          if ( main_image.attr('data-zoom-image') ) {
            poip_main_image().attr('data-zoom-image', img_click);
            poip_main_image().data('zoomImage', img_click);
          
            elevate_zoom_direct_change(img_click, 100);
          }
          return;
        <?php } ?>
				
				<?php if ( $poip_theme_name == 'stowear' || $poip_theme_name == 'themegloballite' ) { ?>
					var poip_img = poip_get_image_by_src(img_click, 'popup');
					if ( poip_img ) {
          
						$('#quickview_product #ex1').attr('href', poip_img['popup']);
						$('#quickview_product #ex1 img').attr('src', poip_img['main']);
						$('#quickview_product #ex1 img').attr('data-zoom-image', poip_img['popup']);
            
            <?php if ( $poip_theme_name == 'themegloballite' ) { ?>
              $('.zoomContainer .zoomWindowContainer div').css({"background-image": 'url("'+poip_img['popup']+'")'});
            <?php } ?>
            
						stowear_refresh_popup();
					}
					return;
				<?php } ?>
        
        <?php if ( $poip_theme_name == 'goshop' ) { ?> //2016/03/17
          var poip_img = poip_get_image_by_src(img_click, 'popup'); 
					if ( poip_img ) {
            poip_elevatezoom_swap(poip_img['popup'],poip_img['popup']);
            //poip_elevatezoom_swap(poip_img['main'],poip_img['popup']);
            poip_refresh_popup_mediacenter();
          }
          return;
        <?php } ?>  
        
        <?php if ( $poip_theme_name == 'mediacenter' ) { ?>
          var poip_img = poip_get_image_by_src(img_click, 'popup');
					if ( poip_img ) {
          
						$('#quickview_product #ex1').attr('href', poip_img['popup']);
            $('#quickview_product #ex1 img').attr('src', poip_img['popup']);
						$('#quickview_product #ex1 img').attr('data-zoom-image', poip_img['popup']);
            
						poip_refresh_popup_mediacenter();
            
					}
					return;
				<?php } ?>
        
				
				<?php if ( $poip_theme_name == 'sellegance' ) { ?>
          // needed only if carousel used
          
          var img_cnt = 0;
          $('#sync1 a').each(function(){
            if ( $(this).attr('href') == img_click ) {
              $('#sync1').trigger("owl.goTo",img_cnt);
              return false;
            }
            img_cnt++;
          });
          
          return;
        <?php } ?>
				
				if (poip_theme_name.substr(0, 9) == 'OPC080186' || poip_theme_name == 'OPC070162' || poip_theme_name.substr(0, 9) == 'OPC080190' ) { // Hair Salon || Lookz || Shine
					return;
				}
				
				if (poip_theme_name == 'art') {
					var elem = $('#content .content-image .carousel-item img:visible:first');
					if (elem.length) {
						var html = poip_outerHTML(elem);
						var pos1 = html.indexOf("zoomImage: '");
						var pos2 = html.indexOf("', autoInside");
						if (pos1 && pos2 && pos2 > pos1) {
							var html1 = html.substr(0,pos1+12);
							var html2 = html.substr(pos2);
							
							html = html1 + img_click + html2;
							elem.replaceWith(html);
							CloudZoom.quickStart();
						}
					}
					return;
				}
				
				if (poip_theme_name == 'sebian') {
					zoom_switch_sebian_cloud_zoom(img_click);
					return;
				}
				
        
				if (poip_theme_name == 'mariposa-purple') {
					var poip_image = poip_get_image_by_src(img_click, 'popup');
					$('.thumbnails .zoomIn a.zoomit').attr('href', img_click);
					$('.thumbnails .zoomIn a.zoomit img').attr('src', poip_image['main']);
					return;
				}
				
				if (poip_theme_name == 'bt_claudine' || poip_theme_name == 'ntl') { // bt_claudine
				
					$("#boss-image-additional-zoom li a").each(function(){
						if ( $(this).attr('href') == img_click ) {
							$(this).click();
							return false;
						}
					});
				
					return;
				}
				
				if (poip_theme_name == 'buyshop') {
					$('div.product-more-views ul li img').each(function(){
						if ( $(this).attr('src') == img_click ) {
							$(this).click();
							return false;
						}
					});
					return;
				}
				
				if (poip_theme_name == 'marketshop') {
				
					setTimeout(function(){
          
						poipImageAdditional().find('a').each(function(){
            
							if ($(this).attr('data-zoom-image') == img_click) {
							
								// progress freezing
								$('#zoom_01').parent().find('div[style*="progress.gif"]').remove();
							
								var ez =   $('#zoom_01').data('elevateZoom');
								ez.swaptheimage($(this).attr('data-image'), $(this).attr('data-zoom-image'));
                
                // it looks like because of theme bug there may be few zooming divs, let's switch image directly
                if ( $('.zoomContainer').length > 1 ) {
                  $('.zoomContainer .zoomWindowContainer div').css({"background-image": 'url("'+$(this).attr('data-zoom-image')+'")'});
                }
							
								// click works badly
								//$(this).find('img').click();
								//$(this).click()
								//setTimeout( function(){ $(this).click() }, 100);
								return false;
							}
						});
					
					}, 100);
					
					return;
				}
				
				// << pav fashion theme - product page & quickview
				if (poip_theme_name == "pav_fashion" || poip_theme_name == "fashion" || poip_theme_name == 'pav_styleshop' || poip_theme_name == 'megashop'
				|| poip_theme_name == 'lexus_shopping' || poip_theme_name == 'pav_sportshop' ) {
				
					pav_fashion_zoom_switch(img_click);
					return;
				}
				// >> pav fashion theme - product page & quickview
			
				// << elevatezoom compatibility / theme 422
				if ( elevate_zoom_select_image(img_click) ) return;
				// >> elevatezoom compatibility  / theme 422
				
				
				if (poip_theme_name == 'eagency') {
				
					poipImageAdditional().find('a').each(function(){
						if ($(this).attr('data-zoom-image') == img_click) {
							var smallImage = $(this).attr('data-image');
							var largeImage = $(this).attr('data-zoom-image');
							var ez =   $('#image').data('elevateZoom');	
							$('#ex1').attr('href', largeImage);  
							ez.swaptheimage(smallImage, largeImage); 
							return false;

						}
					});
					return;
				}
				
				
				// << product image zoom free compatibility
				$('div.image-additional').find('a.cloud-zoom-gallery').each( function () {
				
					if ($(this).attr('href') == img_click) {
						$(this).find('img').click();
						return false;
					} else if (poip_theme_name == 'shopme' && img_click.indexOf($(this).attr('href')) != -1 ) {
						$(this).find('img').click();
						return false;
					}
					
				});
				// >> product image zoom free compatibility
				
				
				if (poip_theme_name == 'mattimeo') { // only if colorbox replacing is turned ON
					setTimeout(function(){
						$('div.image-additional a').each(function(){
							if ($(this).attr('data-zoom-image') == img_click) {
								$(this).find('img').click();
								return false;
							}
						});
					
					}, 100);
					
					return;
				}
				
				// << ava store theme
				if (poip_theme_name == 'ava_store') {
				
					if ($('div.product-info div.image a#zoom_link1').attr('href') && $('.zoomWindowContainer').length && $('.zoomWindowContainer').find('div').length) {
					
						ava_store_zoom_switch(img_click);
						
					} else {
						
						setTimeout(function(){
							ava_store_zoom_switch(img_click);
						}, 100);
						
					}
					
					return;
				}
				// >> ava store theme
				
				
				// journal2 allows to use other zooming - zm-viewer
				if (poip_theme_name == 'journal2' && $('div.zm-viewer').length) {
				
					/*
					$('#product-gallery a').each(function(){
						
						if ( $(this).attr('href') == img_click ) {
							setTimeout( function(){
								$(this).find('img').click();
							}, 10);
							//$(this).find('img').click();
							return false;
						}
					});
					*/
					
					// not found in additional images, change image direclty
					for (var i in poip_images) {
          
						if (poip_images[i]['popup'] == img_click) {
            
							$('#image').data('imagezoom').changeImage(poip_images[i]['main'], poip_images[i]['popup']);
							//$('div.zm-viewer').find('img.zm-fast').attr('src', poip_images[i]['main']);
							//$('div.zm-viewer').find('img').last().attr('src', poip_images[i]['popup']);
							//$('#image').attr('data-largeimg', poip_images[i]['popup']);
							break;
						}
					}
					return;
				}
				
				/// << theme lexus superstore & journal2 & pav fashion (product page)
				if ($('.image a #image').attr('data-zoom-image') && $('.zoomWindowContainer').length && $('.zoomWindowContainer').find('div').length) {
					lexus_superstore_zoom_switch(img_click);
					return; 
				} else if ($('.image a #image').attr('data-zoom-image')) {
					setTimeout(function () { lexus_superstore_zoom_switch(img_click); }, 100);
					return;
				}
				// >> theme lexus superstore
				
				// << theme start zoom
				$('#image-additional').find('a[data-zoom-image]').each( function () { // all elements with attribute 'data-zoom-image'
					if ($(this).attr('href') == img_click) {
						$(this).click();
						return;
					}
				});
				// >> theme start zoom
				
				// << theme neocart
				if ( $('.product-img-box a.cloud-zoom-gallery').length ) {
					$('.product-img-box a.cloud-zoom-gallery').each(function () {
						if ($(this).attr('href') == img_click ) {
							$(this).click();
							return;
						}
					});
				}
				// >> theme neocart
				
			}
			
			
			function poip_set_main_image_pavilion(main, popup, counter) {
			
				$('#product meta[itemprop=image]').attr('content', popup);
			
				if (!counter) counter = 1;
				if (counter == 10) return;
				
				if (!$('.fotorama').length || !$('.fotorama').data('fotorama')) {
					setTimeout(function () {
						poip_set_main_image(main, popup, counter+1)
					}, 100);
					return;
				}
				
				for (var i in $('.fotorama').data('fotorama').data) {
					var f_data = $('.fotorama').data('fotorama').data[i];
					
					if (f_data['img']==popup) {
						$('.fotorama').data('fotorama').show(i);
						return;
					}
					
				}
				
			}
			
			function poip_set_main_image(main, popup) {

				if (poip_theme_name == 'art') {
					
					$('#content .content-image .carousel-item img:visible:first').attr('src', main);
					
				} else if (poip_theme_name == 'pavilion') {
				
					poip_set_main_image_pavilion(main, popup);
					
				} else if (poip_theme_name != 'stowear' && poip_theme_name != 'themegloballite' ) {
					poip_main_image().attr('src', main);
					poip_main_image().closest('a').attr('href', popup);
				}
				
			}
			
      function poip_change_images(option) {
      
        var product_option_id = option.name.substr(option_prefix_length+1, option.name.indexOf(']')-(option_prefix_length+1) );
        
				if ($.inArray(product_option_id, poip_product_option_ids)==-1) {
          return;
        }
				
        images_to_show = poip_change_available_images(product_option_id);
				
				var value = option.value;
				var selected_values = get_selected_values();
        
				if (images_to_show.length==0 && value && $.inArray(value, selected_values)==-1 && poip_std_src && poip_std_href) {
					<?php if ( !($poip_theme_name == 'mattimeo' && $poip_mattimeo_settings['product_zoom']==1) ) { ?>
						poip_set_main_image(poip_std_src, poip_std_href);
						//poip_main_image().attr('src', poip_std_src);
						//poip_main_image().closest('a').attr('href', poip_std_href);
					<?php } ?>
				}
				
				var images_to_check = [];
				if ( value && $.inArray(value, selected_values) != -1 ) {
					for (var i=0;i<poip_images.length;i++) {
						if ( poip_images[i]['product_option_value_id'] && $.inArray(value, poip_images[i]['product_option_value_id']) != -1 && $.inArray(poip_images[i]['popup'], images_to_show) != -1 ) {
							images_to_check.push( images_to_show[$.inArray(poip_images[i]['popup'], images_to_show)] );
						}
					}
				}
				
				if ( !images_to_check.length ) {
					images_to_check = images_to_show;
				}
				
				
				// first time on options combination
				// if filtration is used, take first filtered image, else first option image
				var main_image_switched = false;
				if (images_to_check && ((poip_options_settings[product_option_id]['img_limit'] && poip_options_settings[product_option_id]['img_use'])
															|| (value && $.inArray(value, selected_values)==-1)) ) { //если отменили выбор опции, то тоже показываем первую из доступных картинок
				//if (images_to_check && poip_options_settings[product_option_id]['img_limit'] && poip_options_settings[product_option_id]['img_use']) {
					for (var i=0;i<poip_images.length;i++) {
						if (images_to_check[0] == poip_images[i]['popup']) {
						
							<?php if ( !($poip_theme_name == 'mattimeo' && $poip_mattimeo_settings['product_zoom']==1) ) { ?>
								poip_set_main_image(poip_images[i]['main'], poip_images[i]['popup']);
								//poip_main_image().attr('src', poip_images[i]['main']);
								//poip_main_image().closest('a').attr('href', poip_images[i]['popup']);
							<?php } ?>
							
							// << zoom compatibility
							image_zoom_click(poip_images[i]['popup']);
							// >> zoom compatibility
							
							var main_image_switched = true;
						}
					}
				}
				
				if (!main_image_switched) {
        
					// then on selected option images
					
					if (value && $.inArray(value, selected_values)!=-1) {
					
						// main image change
						if (poip_options_settings[product_option_id] && poip_options_settings[product_option_id]['img_change'] ) {
						
							if (poip_images_by_options[value]) {
							
								image = poip_images_by_options[value][0]['image'];
								
								for (var i=0;i<poip_images.length;i++) {
								
									if (image == poip_images[i]['image']) {

										poip_set_main_image(poip_images[i]['main'], poip_images[i]['popup']);
										//poip_main_image().attr('src', poip_images[i]['main']);
										//poip_main_image().closest('a').attr('href', poip_images[i]['popup']);
										
										// << zoom compatibility
										image_zoom_click(poip_images[i]['popup']);
										// >> zoom compatibility
				
										break;
									}
								}
							}
	
						}
					}
				}
        
        <?php if ( $poip_theme_name == 'sellegance' ) { ?>
          // sellegance comp, if there's no carousel - popup update for main image
          var main_image_elem = $('#image');
          if ( main_image_elem.length ) {
            var current_img = poip_get_image_by_src(main_image_elem.attr('src'), 'main');
            if ( current_img && current_img['popup'] ) {
              main_image_elem.siblings('a').attr('href', current_img['popup']);
            }
          }
        <?php } ?>
        
        // images showing under options
        if (poip_options_settings[product_option_id] && poip_options_settings[product_option_id]['img_option'] ) {
          if (!$('product_option_images'+product_option_id).length) {

            // checkbox may have many values
            if ($(option).prop('tagName')=='INPUT' && $(option).prop('type')=='checkbox' ) {
              var values = [];
              $('input[type=checkbox][name^='+option_prefix+'\\['+product_option_id+'\\]]:checked').each( function() {
                values.push($(this).val());
              });
            } else {
              var values = [value];
            }
            
            $('#option-images-'+product_option_id).remove();
						var new_style_img_opt = false;
            if (!$('#option-images-'+product_option_id).length) {
							if ($('#option-'+product_option_id).length) { // OC 1.X style
								$('#option-'+product_option_id).append('<div id="option-images-'+product_option_id+'"></div>');
							} else { // OC 2.0 style
								if ( poip_theme_name == 'ranger' && $(option).parent().is('label') ) {
									$(option).parent().after('<div id="option-images-'+product_option_id+'" style="margin-top: 10px;"></div>');
								} else { // default
									$(option).after('<div id="option-images-'+product_option_id+'" style="margin-top: 10px;"></div>');
								}
								new_style_img_opt = true;
							}
            }
            
            $('#option-images-'+product_option_id).html('');
            for (var i=0; i<poip_images.length; i++) {
              for (var j=0; j<values.length; j++) {
                if (poip_images[i]['product_option_value_id'] && $.inArray(values[j], poip_images[i]['product_option_value_id']) != -1) {
                  var html_image = '<a href="'+poip_images[i]['popup']+'" class="image-additional" style="margin: 5px;"><img src="'+poip_images[i]['thumb']+'" ></a>';
                  $('#option-images-'+product_option_id).append(html_image);
                }
              }
            }
						
						// OC 2.0 new-style default
						if ( new_style_img_opt && $('#option-images-'+product_option_id+' a').length ) {
							$('#option-images-'+product_option_id).magnificPopup({
								type:'image',
								delegate: 'a',
								gallery: {
									enabled:true
								}
							});
						}

          }
        }
        
      }
			
			function poip_get_option_images(product_option_id) {
				var images = [];
				
				for (var product_option_value_id in poip_images_by_options) {
					for (var i in poip_images_by_options[product_option_value_id]) {
						if (poip_images_by_options[product_option_value_id][i]['product_option_id'] == product_option_id) {
							images.push(poip_images_by_options[product_option_value_id][i]['image']);
						}
					}	
				}
				return images;
			}
			
			function poip_get_option_value_images(product_option_value_id) {
				var images = [];
				for (var i in poip_images_by_options[product_option_value_id]) {
					images.push(poip_images_by_options[product_option_value_id][i]['image']);
				}	
				return images;
			}
			
			function poip_get_image_src(image, src) {
				for (var i in poip_images) {
					if (poip_images[i]['image'] == image) {
						return poip_images[i][src];
					}
				}
				return '';
			}
			
			function poip_get_image_by_src(image, src) {
				for (var i in poip_images) {
					if (poip_images[i][src] == image) {
						return poip_images[i];
					}
				}
				return '';
			}
			
			function poip_dependent_thumbnails() {
				
				for (var j in poip_product_option_ids) {
					
					var product_option_id = poip_product_option_ids[j];
					
					if (poip_options_settings[product_option_id] && poip_options_settings[product_option_id]['dependent_thumbnails']
							&& poip_options_settings[product_option_id]['img_first'] == 1 ) {
						
						var option_images = poip_get_option_images(product_option_id);
						
						for (var i in poip_product_option_ids) {
							
							if (poip_product_option_ids[i] == product_option_id) continue;
							var current_product_option_id = poip_product_option_ids[i];
							
							var current_product_option_selected_values = get_selected_values(0, current_product_option_id);
							
							var current_option_images = [];
							for (var poip_images_i in poip_images) {
								if (poip_images[poip_images_i]['product_option_value_id'] && poip_images[poip_images_i]['product_option_value_id'].length) {
									for (var copsv_i in current_product_option_selected_values) {
										if ($.inArray(current_product_option_selected_values[copsv_i], poip_images[poip_images_i]['product_option_value_id']) !== -1
											&& $.inArray(poip_images[poip_images_i]['image'], current_option_images) == -1 ) {
											current_option_images.push(poip_images[poip_images_i]['image']);
										}
									}
								}

							}
							option_images = poip_array_intersection(option_images, current_option_images);
							
						}
						
						if (option_images.length == 0) {
							option_images = poip_get_option_images(product_option_id);
						}
						
						// change options icons
						$('#product').find('input[type=radio][name="'+option_prefix+'['+product_option_id+']"], input[type=checkbox][name="'+option_prefix+'['+product_option_id+']"]').each(function(){
							option_value_images = poip_get_option_value_images($(this).val());
							if (option_value_images.length) {
								current_option_value_images	= poip_array_intersection(option_value_images, option_images);
								if (current_option_value_images.length) {
									$(this).next('img').attr('src', poip_get_image_src(current_option_value_images[0], 'option_thumb') );
								} else {
									$(this).next('img').attr('src', poip_get_image_src(option_value_images[0], 'option_thumb') );
								}
							}
						});
							
						
						
						
					}
					
				}
				
			}
      
			var poip_option_value_selected_works = false;
			var poip_option_value_selected_timeout_id = 0;
			
      function poip_option_value_selected(option) {
      
        clearTimeout(poip_option_value_selected_timeout_id);
      
				// not run twice parallel
				if ( poip_option_value_selected_works || poip_set_visible_images_timeout_id !== false) {
					poip_option_value_selected_timeout_id = setTimeout(function(){
						poip_option_value_selected(option);
					}, 100);
					return;
				}
				
				poip_option_value_selected_works = true;
			
				poip_change_images(option);
        
        poip_popup_refresh();
				
				poip_dependent_thumbnails();
				
				poip_option_value_selected_works = false;
        
      }
			
			// return IMG element relevant to main image
			function poip_main_image() {
			
				if ( poip_theme_name == 'coloring' ) {
					return $('.main-image img');
				}
        
        if (poip_theme_name.substr(0, 14) == 'so-shoppystore') {
          return $('.large-image img');
        }
			
				var oc2_main_img = $('ul.thumbnails li').not('.image-additional').find('a img');
				if ( oc2_main_img.length ) { // OC 2.0 default
					return oc2_main_img;
				}
			
			
				if (!$('#image').length) {
					if ($('#main-image').length) {
						return $('#main-image'); // theme start compatibility
					}
					if ($('div.product-info div.image a img').length) {
						return $('div.product-info div.image a img'); // theme cosyone compatibility
					}
					if ($('div.row-product a img[itemprop="image"]').length) {
						return $('div.row-product a img[itemprop="image"]'); // theme moneymaker compatibility
					}
				}
				return $('#image'); // by standard default
			}
      
			function poip_outerHTML(elem) {
        str = $(document.createElement("div")).append(elem.clone()).html();
        return str;
      }
			
			// returns element/elements (div, ul, li etc, depend on theme) containing links to additional images (а)
			function poipImageAdditional() {
				if (poip_theme_name == 'moneymaker') {
					return $('div.row-product div.images');
					
				//} else if (poip_theme_name == 'pavilion') {
				//	return $('#product_images_thumbs .fotorama__nav-wrap .fotorama__thumb');
				
				} else if ( poip_theme_name == 'eagency' && $('.product-info .thumbnails li, .product-info .thumbnails-left li').length) {
				
					return $('.product-info .thumbnails li, .product-info .thumbnails-left li');
          
        } else if ( poip_theme_name == 'fastor' ) {
        
          return $('.product-info .popup-gallery .thumbnails');
					
				} else if (poip_theme_name == 'theme500' || poip_theme_name == 'theme533' || poip_theme_name == 'theme541' || poip_theme_name == 'theme546'
					|| poip_theme_name == 'theme560' || poip_theme_name == 'theme563' || poip_theme_name == 'theme573' || poip_theme_name == 'theme593' || poip_theme_name == 'theme638') {
				
					return $('#image-additional li');
					
				} else if (poip_theme_name == 'coloring') {	
				
					return $('.images-additional');
					
				} else if (poip_theme_name == 'stowear' || poip_theme_name == 'themegloballite') {
					return $('#quickview_product .popup-gallery .thumbnails');
          
        } else if (poip_theme_name == 'mediacenter' || poip_theme_name == 'goshop' ) {
					return $('#quickview_product .popup-gallery .thumbnails-carousel');  
				
				} else {
					
					if ( $('li.image-additional').length ) { // OC 2.0 default
						return $('li.image-additional');
					}
				
					if ( !$('div.image-additional').length ) {
						$('div.product-info div.image').after('<div class="image-additional"></div>');
					}
				
					return $('div.image-additional');
				}
			}
			
      function refresh_colorbox() {
			
				// OC 2.0 not uses colorbox in default theme
					if (!use_refresh_colorbox) return;
					
					if (typeof(poip_journal2_quickview) !== 'undefined' && poip_journal2_quickview) return;
					
					<?php if ($poip_theme_name == 'mattimeo' && $poip_mattimeo_settings['product_zoom'] == '1') { ?> // optional gallery instead of colorbox
						return; 
					<?php } ?>
					
					if (poip_settings['img_gal']) {
					
						<?php if (isset($poip_theme_name) && $poip_theme_name=='moneymaker' && $poip_moneymaker_settings['mmr_product_gallery_type']=='photobox') { ?>
							
							// use main gallery with options filter, main image click transferring to gallery image click
							
							//$('.photobox').data("_photobox").destroy(); - глючит
							
							// remove standard photobox if exists
							if ($('.photobox').data("_photobox")) {
								var _photobox = $('.photobox').data("_photobox");
								_photobox.selector.off('click.photobox', _photobox.target)
								$('.photobox').removeData('_photobox');
							}
								
							// remove our photobox if exists
							if ($('div.images .photobox').data("_photobox")) {
								var _photobox = $('div.images .photobox').data("_photobox");
								_photobox.selector.off('click.photobox', _photobox.target)
								$('div.images .photobox').removeData('_photobox');
							}	
								
							$('div.images .photobox').photobox('a:visible');
							
							poip_main_image().parent().unbind('click', poip_photobox_main_image_click_function);
							poip_main_image().parent().bind('click', poip_photobox_main_image_click_function);
							
							return;
						<?php } ?>
						
						<?php if (isset($poip_theme_name) && $poip_theme_name=='moneymaker' && $poip_moneymaker_settings['mmr_product_gallery_type']=='fancybox') { ?>
							
							// make gallery copy, only with visible images, images clicks transfers to gallery
							
							$('#poip_fancybox').remove();
							poipImageAdditional().after('<div style="display: none" id="poip_fancybox"></div>');
							
							var fancybox_images = [];
							$('div.images a.fancybox:visible').each(function(){
								if ( $.inArray($(this).attr('href'), fancybox_images)==-1 ) {
									$('#poip_fancybox').append( poip_outerHTML($(this)).replace('data-rel="fancybox"', 'data-rel="poip_fancybox"').replace('fancybox', 'poip_fancybox') );
									fancybox_images.push($(this).attr('href'));
								}
							});
							
							$(document).unbind("click.fb-start");
							
							$('.poip_fancybox').removeData('fancybox');
							$('.fancybox').removeData('fancybox');
							//$('div[id^=fancybox-]').remove();
							//$.fancybox.init();
							
							$('.poip_fancybox').fancybox({
								'padding'	:	20,
								'transitionIn'	:	'fade',
								'transitionOut'	:	'fade',
								'overlayOpacity' : 0.7,
								'overlayColor' : '#000',
								'opacity'		: true,
								'titleShow'		: false,
								'showNavArrows'		: true,
								onStart: function() { if(navigator.appVersion.indexOf("MSIE 8.")!=-1) {$("html, body").animate({scrollTop:0}, 'slow');}; },
								onComplete: function() {
									$("#fancybox-wrap").prepend("<div id='image-appendix'><div class='title hidden-xs'><?php echo $heading_title; ?></div><div class='btn-group btn-group-lg hidden-xs additional-buttons'><?php if (!$mmr_buyhide) { ?><button class='btn btn-primary' type='button' onclick='$(\"#image-appendix\").remove();$(\"#button-cart\").click();$.fancybox.close()'><i class='fa fa-shopping-cart'></i> <?php echo $button_cart; ?></button><input type='text' data-toggle='tooltip' class='form-control input-lg' name='quantities' size='2' value='<?php echo $minimum; ?>' title='<?php echo $text_qty; ?>' /><?php if ($mmr_qorder&&$poip_moneymaker_settings['mmr_quickorder_popup_button_disabled']!=1) { ?><a class='btn btn-default' onclick='$(\"#image-appendix\").remove();$.fancybox.close();$(\".btn-quickorder\").click();'><i class='fa fa-flip-horizontal fa-reply-all'></i> <span><?php echo $this->language->get('text_mmr_quickorder_button'); ?></span></a><?php } ?><?php } ?><?php if (!$poip_moneymaker_settings['mmr_common_btn_wishlist_hidden']) { ?><button type='button' data-toggle='tooltip' class='btn btn-default' title='<?php echo $button_wishlist; ?>' onclick='addToWishList(<?php echo $product_id; ?>);$.fancybox.close()'><i class='fa fa-heart'></i></button><?php } ?><?php if (!$poip_moneymaker_settings['mmr_common_btn_compare_hidden']) { ?><button type='button' data-toggle='tooltip' class='btn btn-default' title='<?php echo $button_compare; ?>' onclick='addToCompare(<?php echo $product_id; ?>);$.fancybox.close()'><i class='fa fa-bar-chart-o'></i></button><?php } ?></div></div>");
									$('input[name=\"quantities\"]').keyup(function(){document.getElementsByName('quantity')[0].value = $(this).val(); });
								},
								onCleanup: function() {
									$("#image-appendix").remove()
								}
							});
							
							$('.fancybox').unbind('click', poip_fancybox_click_function);
							$('.fancybox').bind( 'click', poip_fancybox_click_function );
							
							return;
						<?php } ?>	
						
						
					
						$('#poip_colorbox').remove();
						
						poipImageAdditional().after('<div style="display: none" id="poip_colorbox"></div>');
						
						var colorbox_images = [];
	
						if (poip_theme_name == 'cosyone') {
							var visible_images = $('div.image-additional ul.image_carousel a[href!="#"]');
						} else if (poip_theme_name == 'ava_store') {
							var visible_images = poipImageAdditional().find('a:visible[data-image]');
						} else {
							// more compatible
							var visible_images = poipImageAdditional().find('a:visible[href!="#"]');
						}
						// more compatible
						visible_images.each(function(){
							var img_href = poip_theme_name == 'ava_store' ? $(this).attr('data-image') : $(this).attr('href') ;
							if ($.inArray( img_href, colorbox_images) == -1) {
								$('#poip_colorbox').append( poip_outerHTML($(this)).replace('colorbox', 'poip_colorbox') );
								colorbox_images.push(img_href);
							}
						});
						
						
						/* add main image to gallery, even if it's not included in additional images */
						if ($.inArray(poip_main_image().parent().attr('href'), colorbox_images) == -1) {
							$('#poip_colorbox').append( poip_outerHTML(poip_main_image().parent()).replace('colorbox', 'poip_colorbox') );
							colorbox_images.push(poip_main_image().parent().attr('href'));
						}
						
						// for ava store and, possible, other templates, poip_colorbox should be additionally filled
						$('#poip_colorbox a[href!="#"], #poip_colorbox a[href="#"][data-image]').each(function(){
							if ( !$(this).hasClass('poip_colorbox') ) {
								$(this).addClass('poip_colorbox');
							}
							if ($(this).attr('href') == '#' && $(this).attr('data-image')) {
								$(this).attr('href', $(this).attr('data-image'));
							}
						});
						
						if (typeof($.colorbox) !== 'undefined') {
							$.colorbox.remove();
						}
						
						// << pav fashion theme compatibility
						if ((poip_theme_name == 'pav_fashion' || poip_theme_name == 'fashion' || poip_theme_name == 'pav_styleshop' || poip_theme_name == 'megashop'
						|| poip_theme_name == 'lexus_shopping' || poip_theme_name == 'pav_sportshop' ) && $.colorbox) {
							
							// for quickview
							$('.pav-colorbox').colorbox({
									width: '980px', 
									height: '80%',
									overlayClose: true,
									opacity: 0.5,
									iframe: true, 
							});
							
							// if used zoom, colorbox for images not used
							if ($('#image-additional').find('a[data-zoom-image][data-image]').length && $('.zoomWindowContainer').find('div').length) {
								$('#image-additional').find('a[data-zoom-image][data-image]').click(function (event) {
									event.preventDefault();
								});
								return;
							}
						}
						// >> pav fashion theme compatibility
						
						if ($.colorbox) {
						
							if (poip_theme_name == 'moneymaker') {
							
								colorbox_settings = {
									next: "<button class='btn btn-default' type='button'><i class='fa fa-fw fa-chevron-right'></i></button>",
									previous: "<button class='btn btn-default' type='button'><i class='fa fa-fw fa-chevron-left'></i></button>",
									close: "<button class='btn btn-default' type='button'><i class='fa fa-fw fa-times'></i></button>",
									rel: "colorbox",
									onOpen: function() {
										$("#colorbox").prepend("<div id='image-appendix'><div class='title hidden-xs'>iPhone</div><div class='btn-group btn-group-lg hidden-xs additional-buttons'><button class='btn btn-primary' type='button'  onclick='$(\"#image-appendix\").remove();$(\"#button-cart\").click();'><i class='fa fa-shopping-cart'></i> Купить</button><input type='text' data-toggle='tooltip' class='form-control input-lg' name='quantities' size='2' value='1' title='Количество:' /><button type='button' data-toggle='tooltip' class='btn btn-default' title='в закладки' onclick='addToWishList(40);'><i class='fa fa-heart'></i></button><button type='button' data-toggle='tooltip' class='btn btn-default' title='сравнение' onclick='addToCompare(40);'><i class='fa fa-bar-chart-o'></i></button></div></div>");
										$('input[name=\"quantities\"]').keyup(function(){document.getElementsByName('quantity')[0].value = $(this).val(); });
									},
									onComplete: function() { if(navigator.appVersion.indexOf("MSIE 8.")!=-1) {$("html, body").animate({scrollTop:0}, 'slow');}; },
									onClosed: function() {
										$("#image-appendix").remove()
									}
								}
							
							} else {
								var colorbox_settings = false;
								try {
									var scripts = $('script:contains(".colorbox")');
									for (var i=0; i<scripts.length; i++) {
										var script_html  =$(scripts[i]).html();
										if (script_html.indexOf('$(\'.colorbox\').colorbox(') != -1 ) {
											var str_pos = script_html.indexOf('$(\'.colorbox\').colorbox(');
											var str = script_html.substr(str_pos+24);
											str_pos = str.indexOf('});');
											str = str.substr(0,str_pos+1);
											colorbox_settings = eval('('+str+')');
											break;
										}
									}
								} catch (e) {
									console.debug(e);
									colorbox_settings = false
								}
								
								if (!colorbox_settings || (typeof colorbox_settings) != 'object') {
									console.log('colorbox settings not found');
									colorbox_settings = {
										overlayClose: true,
										opacity: 0.5,
										rel: "colorbox"
									};
								}
							}
							
							//if (poip_theme_name != 'cosyone' || !$('#zoom-btn').length) {
								$('.poip_colorbox').colorbox(colorbox_settings);
								//$('.colorbox').colorbox(colorbox_settings);
							//}
						
						
							try {
								$('[id^=option-images-]').each( function() {
									
									colorbox_settings['rel'] = $(this).attr('id');
									// more compatible
									$(this).find('a').colorbox(colorbox_settings);
									//$(this).children('a').colorbox(colorbox_settings);
									
								});
							} catch(e) {
								console.debug(e);
								console.debug("colorbox under options gallery error");
							}
						
						}
						
						if (poip_theme_name == 'polianna') {
							$('#plus').click(function(event){
								event.preventDefault();
								var poip_colorbox = $('a.poip_colorbox[href!="#"]');
								for (var i=0; i<poip_colorbox.length; i++) {
									if ($(this).parent().attr('href') == poip_colorbox[i].href || $(this).parent().attr('href') == decodeURIComponent(poip_colorbox[i].href)) {
										$(poip_colorbox[i]).trigger('click');
										break;
									}
								}
							});
						} else if (poip_theme_name == 'cosyone' && $('#zoom-btn').length) {
							// in cosyone depending on settings zoom may be enabled, then popup only on plus "+"
							$('#zoom-btn').unbind('click');
							$('#zoom-btn').click(function(event){
								event.preventDefault();
								var poip_colorbox = $('a.poip_colorbox[href!="#"]');
								for (var i=0; i<poip_colorbox.length; i++) {
									if ($(this).attr('href') == poip_colorbox[i].href || $(this).attr('href') == decodeURIComponent(poip_colorbox[i].href)) {
										$(poip_colorbox[i]).trigger('click');
										break;
									}
								}
							});
							
						} else if (poip_theme_name == 'ava_store' && $('#zoom_link1').length) {
							$('#zoom_link1').unbind('click');
							$('#zoom_link1').click(function(event){
								event.preventDefault();
								
								if ($('.zoomWindowContainer').find('div').css('background-image')) {
									// should be the same image like in zoom
									var back_image = $('.zoomWindowContainer').find('div').css('background-image');
									if (back_image.substr(0,4)=='url(' && back_image.substr(-1) == ')') {
										back_image = back_image.substr(4,back_image.length-5);
									}
									$('#zoom_link1').attr('href', back_image);
									$('#zoom_link1').attr('data-image', back_image);
								}
								
								var poip_colorbox = $('#poip_colorbox a.poip_colorbox[data-image]');
								
								for (var i=0; i<poip_colorbox.length; i++) {
									var poip_colorbox_href = $(poip_colorbox[i]).attr('data-image');
									if ($(this).attr('href') == poip_colorbox_href || $(this).attr('href') == decodeURIComponent(poip_colorbox_href)) {
										$(poip_colorbox[i]).trigger('click');
										break;
									}
								}
							});	
							
						} else {
							
							$('.colorbox').unbind('click', poip_colorbox_click_function);
							$('.colorbox').bind( 'click', poip_colorbox_click_function );
						}
						
					}
				
      }
			
			var poip_colorbox_click_function = function(event) {
			
				event.preventDefault();
			
				var this_data = ( poip_theme_name=='moneymaker' ? $(this).find('a') : $(this) );
				var poip_colorbox = $('a.poip_colorbox[href!="#"]');
				
				for (var i=0; i<poip_colorbox.length; i++) {
					if (this_data.attr('href') == poip_colorbox[i].href || this_data.attr('href') == decodeURIComponent(poip_colorbox[i].href)) {
						$(poip_colorbox[i]).trigger('click');
						break;
					}
				}
			}
			
			var poip_fancybox_click_function = function(event) {
			
				event.preventDefault();
			
				var this_data = $(this);
				var poip_box = $('a.poip_fancybox');
				
				for (var i=0; i<poip_box.length; i++) {
					if (this_data.attr('href') == $(poip_box[i]).attr('href') ) {
						$(poip_box[i]).trigger('click');
						break;
					}
				}
			}
			
			var poip_photobox_main_image_click_function = function(event) {
			
				event.preventDefault();
			
				var this_data = $(this);
				var poip_box = $('div.images a:visible');
				
				for (var i=0; i<poip_box.length; i++) {
					if (this_data.attr('href') == $(poip_box[i]).attr('href') ) {
						$(poip_box[i]).trigger('click');
						break;
					}
				}
			}
			
			function poip_is_video_href(href) {
			
				if ( href ) {
				
					if ( href.indexOf('https://www.youtube.com')==0 || href.indexOf('http://www.youtube.com')==0
					|| href.indexOf('https://youtube.com')==0 || href.indexOf('http://youtube.com')==0
					|| href.indexOf('https://www.vimeo.com')==0 || href.indexOf('http://www.vimeo.com')==0
					|| href.indexOf('https://vimeo.com')==0 || href.indexOf('http://vimeo.com')==0
					|| href.indexOf('www.youtube.com')==0
					|| href.indexOf('youtube.com')==0
					|| href.indexOf('www.vimeo.com')==0
					|| href.indexOf('vimeo.com')==0 ) {
						return true;
					}
					
				}
				
				return false;
				
			}
      
      function poip_image_mouseover(image_a) {
      
				if ($(image_a).is('img')) {
					href = $(image_a).attr('src');
          
				} else if ( (poip_theme_name == 'mattimeo' || poip_theme_name == 'marketshop' || poip_theme_name == 'lexus_shopping') && $(image_a).attr('data-zoom-image')) {
					href = $(image_a).attr('data-zoom-image') ;
				} else {
					href = ($(image_a).attr('href') && $(image_a).attr('href')!='#') ? $(image_a).attr('href') : $(image_a).attr('data-image') ;
				}
				
				if ( poip_is_video_href(href) ) {
					return;
				}
				
        for (var i=0;i<poip_images.length;i++) {
				
          if ( (poip_images[i]['popup'] && poip_images[i]['popup'] == href) || (poip_images[i]['thumb'] && poip_images[i]['thumb'] == href) ) {
						
						<?php if ( !($poip_theme_name == 'mattimeo' && $poip_mattimeo_settings['product_zoom']==1)
              && $poip_theme_name != 'stowear' && $poip_theme_name != 'themegloballite' && $poip_theme_name != 'mediacenter' && $poip_theme_name != 'goshop' ) { ?>
							poip_main_image().attr('src', poip_images[i]['main']);
							poip_main_image().closest('a').attr('href', poip_images[i]['popup']);
						<?php } ?>
						
						image_zoom_click(poip_images[i]['popup']);
				
            break;
          }
        }
        
        <?php if ( substr($poip_theme_name, 0, 14) == 'so-shoppystore' ) { ?>
          $(image_a).closest('#thumb-slider').find('li a').removeClass('active');
          $(image_a).addClass('active');
        <?php } ?>
				
        poip_popup_refresh();
				
      }
      
      function set_option_value(value) {
			
        var options = $('select[name^="'+option_prefix+'["]').children('option');
        for (var i=0; i<options.length;i++) {
          if (options[i].value == value) {
					
						// Product Block Option compatibility
						if ( $('a[option-value='+value+']').length ) {
							$('a[option-value='+value+']').click();
							return;
						}
					
            $(options[i]).parent().val(value);
            $(options[i]).parent().trigger('change');
						
           return;
          }
        }
        
        var options = $('input[type=radio][name^='+option_prefix+'\\[]');
        for (var i=0; i<options.length;i++) {
				
          if (options[i].value == value) {
					
						// Product Block Option compatibility
						if ( $('a[option-value='+value+']').length ) {
							$('a[option-value='+value+']').click();
							return;
						}
						
						// bt_comohos compatibility
						
						if ( $(options[i]).parent().parent().is('.bt-image-option') ) {
							$(options[i]).parent().click();
							return;
						}
            
            // fastor
            if ( poip_theme_name == 'fastor' && $(options[i]).parent().parent().is('.radio-type-button2, .radio-type-button') && $(options[i]).siblings('span').length ) {
              $(options[i]).siblings('span').click();
							//$(options[i]).parent().parent().click();
							return;
						}
						
					
            options[i].checked = true;
            $(options[i]).trigger('change');
            return;
          }
        }
        
        var options = $('input[type=checkbox][name^='+option_prefix+'\\[]');
        for (var i=0; i<options.length;i++) {
          if (options[i].value == value) {
            options[i].checked = true;
            $(options[i]).trigger('change');
            return;
          }
        }
        
      }
			
			function poip_image_mouseover_pavilion_turn_on(counter) {
			
				$('#product').on('mouseover', '.fotorama__thumb img.fotorama__img', function() {
					if ( $('.fotorama').length && $('.fotorama').data('fotorama') ) {
						for (var i in $('.fotorama').data('fotorama').data) {
							var fotorama_img = $('.fotorama').data('fotorama').data[i];
							if (fotorama_img['thumb'] == $(this).attr('src')) {
								$('.fotorama').data('fotorama').show(i);
								return;
							}
						}
					}
				});
			
			}
      
			function poipCheckEventsForSelects(first_time) {

				$('select[name^="'+option_prefix+'["]').each(function () {
					var select_events = $(this).data('events');
					var found_poip = false;
					
					if (select_events && select_events.change) {
						for (var i=0; i<select_events.change.length; i++) {
							if ( (''+select_events.change[i].handler).indexOf('poip_option_value_selected') != -1 ) {
								found_poip = true;
								break;
							}
						}
					}
					
					if (!found_poip) {
						$(this).change( function(){poip_option_value_selected(this);} );
						// event should be called, may be select value is reseted
						if (!first_time) {
							poip_option_value_selected(this);
						}
					}
				});
				
			}
      
			
			
			
			<?php
			if (isset($poip_theme_name)
			&& ($poip_theme_name == 'journal2' || $poip_theme_name == 'pav_fashion' || $poip_theme_name == 'pav_styleshop' || $poip_theme_name == 'megashop'
			|| $poip_theme_name == 'lexus_shopping' || $poip_theme_name == 'pav_sportshop' 
			|| $poip_theme_name == 'cosyone' || $poip_theme_name == 'mattimeo' || $poip_theme_name == 'moneymaker'
			|| $poip_theme_name == 'sellegance' || $poip_theme_name == 'polianna')) { 
			?>
			
				// old style
				
				poipCheckEventsForSelects(true);
				
				$('div.options').click(function(){poipCheckEventsForSelects();});
				
				$("input[type=radio][name^="+option_prefix+"\\[]").each(function (i) {
					$(this).change(function(){
						poip_option_value_selected(this);
					})
				})
				
				if (poip_theme_name == "journal2") {
					if ( $('div.option').find('input:radio').length && $('div.option').find('li[data-value]').length ) {
						$('div.option').find('li[data-value]').click(function(){
							$(this).parents('div.option').find('input:radio[value='+$(this).attr('data-value')+']').change();
						});
					}
					if ( $('div.option').find('select').length && $('div.option').find('li[data-value]').length ) {
						$('div.option').find('li[data-value]').click(function(){
							$(this).parents('div.option').find('select').change();
						});
					}
				}
				
				$("input[type=checkbox][name^="+option_prefix+"\\[]").each(function (i) {
					$(this).change(function(){
						poip_option_value_selected(this);
					})
				})
				
				//images_to_mouseover();
				if (poip_settings['img_hover']) {
					if (poip_theme_name == 'pavilion') {
						poip_image_mouseover_pavilion_turn_on();
					} else {
						// more compatible
						poipImageAdditional().on('mouseover', 'a' ,function(){
							poip_image_mouseover(this);
						});
					}
				}
		
				
				$(document).ready(function(){
        
					poip_set_visible_images(poip_get_global_visible_images());
					poip_popup_refresh();
				
					if (poip_theme_name == 'pavilion') {
						// some options may be selected
						$("[name^="+option_prefix+"\\[]:first").change();
						
					}
					
					if (poip_theme_name == 'stowear' || poip_theme_name == 'themegloballite' ) {
						stowear_refresh_popup() ;
					}
					
					<?php
						
						if (isset($poip_ov) && $poip_ov) {
							echo "var poip_ov = '".(int)$poip_ov."';";
						} else {
							echo "var poip_ov = false;";
						}
					?>
					
					if (poip_ov) {
						// journal 2 compatibility
						setTimeout(function() {
						if ($('.option ul li[data-value='+poip_ov+']').length) {
							$('.option ul li[data-value='+poip_ov+']').click();
						} else {
							set_option_value(poip_ov);
						}
						},1);
					}
				
				});
				
			<?php } else { ?>

				
				// new style
				if ( $.magnificPopup ) {
					poipImageAdditional().find('a').each(function(){
						if ( poip_is_video_href( $(this).attr('href') ) ) {
							if ( !$(this).hasClass('mfp-iframe') ) {
								$(this).addClass('mfp-iframe');
							}
						}
					});
				}
				
				$('#product, .product-options, .product-info .options').on('change', 'select[name^="'+option_prefix+'["], input[type=radio][name^="'+option_prefix+'["], input[type=checkbox][name^="'+option_prefix+'["]', function(){
					poip_option_value_selected(this);
				});
        
				if ( poip_theme_name == 'art' ) {
					$('#product input:radio.image_radio').siblings('img').click(function(){
						var elem = $(this);
						setTimeout( function(){
							elem.siblings('input:radio.image_radio').change();
						}, 100);
					});
				}
				
				//images_to_mouseover();
				if (poip_settings['img_hover']) {
					// more compatible
					if (poip_theme_name == 'pavilion') {
						poip_image_mouseover_pavilion_turn_on();
					} else {
						poipImageAdditional().on('mouseover', 'a' ,function(){
							poip_image_mouseover(this);
						});
					}
				}
        
        <?php if ( $poip_theme_name == 'up-theme' ) { // to avoid ready js error ?>
        setTimeout(function(){
        <?php } else { ?>
				$(document).ready(function(){
        <?php } ?>
        
					poip_set_visible_images(poip_get_global_visible_images());
					poip_popup_refresh();
					
					if ( poip_theme_name == 'stowear' || poip_theme_name == 'themegloballite' ) {
						stowear_refresh_popup() ;
					}
          
          <?php if ( $poip_theme_name == 'mediacenter' || $poip_theme_name == 'goshop' ) { ?>
						poip_refresh_popup_mediacenter() ;
					<?php } ?>
				
					<?php
						if (isset($poip_ov) && $poip_ov) {
							echo "var poip_ov = '".(int)$poip_ov."';";
						} else {
							echo "var poip_ov = false;";
						}
					?>
					
					if (poip_ov) {
						set_option_value(poip_ov);
					}
				
				});
				
				
			<?php }  ?>
      
      //--></script>  
        
      <?php  }  ?>
      <!-- >> Product Option Image PRO module -->
      
<?php echo $footer; ?>
