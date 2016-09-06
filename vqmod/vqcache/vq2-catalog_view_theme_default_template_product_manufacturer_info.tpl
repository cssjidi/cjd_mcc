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
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($products) { ?>
      <p><a href="<?php echo $compare; ?>" id="compare-total"> <?php echo $text_compare; ?></a></p>
      <div class="row">
        <div class="col-sm-3">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-sm-1 col-sm-offset-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-sm-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-sm-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
      <div class="row">      
        <?php foreach ($products as $product) { ?>

			<?php
			// << Product Option Image PRO module 
			$poip_product_images_shown = false; // variable to check and not show poip_img twice for the same product
			// >> Product Option Image PRO module
			?>
			
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" <?php /* Product Option Image PRO module << */ if ($poip_installed) { ?> data-poip_id="image_<?php echo "".$current_class."_".$product['product_id']; ?>" <?php } /*  >> Product Option Image PRO module */ ?>  alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

      
      <?php // Product Option Image PRO module << ?>
			
      <?php  if ($poip_installed && isset($product['option_images']) && $product['option_images'] && $poip_theme_name != "mattimeo"
        && $poip_theme_name != "bt_comohos" && $poip_theme_name != 'stowear' && $poip_theme_name != 'themegloballite' ) {
				
				if (!isset($poip_product_images_shown) ) $poip_product_images_shown = false;
				
				if (!$poip_product_images_shown) {
				
					if ( $poip_theme_name !== 'marketshop') {
						$poip_product_images_shown = true;
					}
				
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
	
						} elseif ($poip_theme_name == "pav_styleshop" ) { // for product_module.tpl
							// just skip
							
						} elseif ($poip_theme_name == "bt_comohos" ) { 	
							
						} elseif ($poip_theme_name == 'eagency') { 
						
							echo "<div data-poip_id=\"poip_img\" style=\"   \">";
							$image_counter = 0;
							foreach ($option_images as $product_option_value_id => $option_image) {
								$image_counter++;
								echo "
												<a onmouseover=\"poip_show_thumb(this);\" 
													style=\"display:inline;float:left;\" href=\"".$product['href'].(strpos($product['href'],'?')===false?'?':'&amp;')."poip_ov=".(int)$product_option_value_id."\"
													".( (isset($option_image['title']) && $option_image['title']) ? " title=\"".$option_image['title']."\" " : "" )."
													data-thumb=\"".$option_image['thumb']."\"
													data-image_id=\"".$current_class."_".$product['product_id']."\">
												<img src=\"".$option_image['icon']."\" class=\"img-thumbnail\" alt=\"".( (isset($option_image['title']) && $option_image['title']) ? $option_image['title'] : "" )."\"></a>
											";
							}
							echo "</div>";
              
            } elseif ($poip_theme_name == 'fastor') { 
						
							echo "<div data-poip_id=\"poip_img\" style=\"   \">";
							$image_counter = 0;
							foreach ($option_images as $product_option_value_id => $option_image) {
								$image_counter++;
								echo "
												<a onmouseover=\"poip_show_thumb(this);\" 
													style=\"display:inline;float:left;\" href=\"".$product['href'].(strpos($product['href'],'?')===false?'?':'&amp;')."poip_ov=".(int)$product_option_value_id."\"
													".( (isset($option_image['title']) && $option_image['title']) ? " title=\"".$option_image['title']."\" " : "" )."
													data-thumb=\"".$option_image['thumb']."\"
													data-image_id=\"".$current_class."_".$product['product_id']."\">
												<img src=\"".$option_image['icon']."\" class=\"img-thumbnail\" alt=\"".( (isset($option_image['title']) && $option_image['title']) ? $option_image['title'] : "" )."\"></a>
											";
							}
							echo "</div>";  
							
						} elseif ($poip_theme_name == "mariposa-purple") {
					
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
												<img style=\"width:auto;height:auto;\" src=\"".$option_image['icon']."\" class=\"img-thumbnail\"></a>
											";
							}
							echo "</div>";	
						
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
				}
      } ?>
      <?php //  >> Product Option Image PRO module ?>
      

      <?php // Product Option Image PRO module << ?>
      <?php  if ($poip_installed && isset($product['option_images']) && $product['option_images'] && $poip_theme_name == "bt_comohos" || $poip_theme_name == "theme573") {
			
				if (!isset($poip_product_images_shown)) $poip_product_images_shown = false;
				
				if (!$poip_product_images_shown) {
				
					$poip_product_images_shown = true;
				
					foreach ($product['option_images'] as $product_option_id => $option_images) {
						
						echo "<div data-poip_id=\"poip_img\" style=\"  text-align: left; margin-top: 3px; width:100%; \">";
						$image_counter = 0;
						foreach ($option_images as $product_option_value_id => $option_image) {
							$image_counter++;
							echo "
											<a onmouseover=\"poip_show_thumb(this);return false;\"
												style=\"display:inline;\" href=\"".$product['href'].(strpos($product['href'],'?')===false?'?':'&amp;')."poip_ov=".(int)$product_option_value_id."\"
												".( (isset($option_image['title']) && $option_image['title']) ? " title=\"".$option_image['title']."\" " : "" )."
												data-thumb=\"".$option_image['thumb']."\"
												data-image_id=\"".$current_class."_".$product['product_id']."\">
											<img src=\"".$option_image['icon']."\" class=\"img-thumbnail\" width=\"23\" height=\"23\" alt=\"".( (isset($option_image['title']) && $option_image['title']) ? $option_image['title'] : "" )."\"></a>
										";
						}
						echo "</div>";
					}
				}
      } ?>
      <?php //  >> Product Option Image PRO module ?>
      

      <?php // Product Option Image PRO module << ?>
      <?php  if ($poip_installed && isset($product['option_images']) && $product['option_images'] && $poip_theme_name == 'opc1000') {
      
        foreach ($product['option_images'] as $product_option_id => $option_images) {
          
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
      
      } ?>
      <?php //  >> Product Option Image PRO module ?>
      
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
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
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 