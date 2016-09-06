<div id="profile">
  <div>
    <?php if ($image) { ?>
    <img src="<?php echo $image; ?>" alt="<?php echo $fullname; ?>" title="<?php echo $username; ?>" class="img-circle" />
    <?php } else { ?>
    <i class="fa fa-shopping-cart"></i>
    <?php } ?>
  </div>
  <div>
    <h4><?php echo $fullname; ?></h4>
    <small><?php echo $user_group; ?></small>
  </div>
</div>
