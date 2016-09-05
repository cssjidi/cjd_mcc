<h3><?php echo $heading_title; ?></h3>
<div class="row">
  <?php foreach ($products as $product) { ?>

			<?php
			// << Product Option Image PRO module 
			$poip_product_images_shown = false; // variable to check and not show poip_img twice for the same product
			// >> Product Option Image PRO module
			?>
			
  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
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
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
