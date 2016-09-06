<div class="m-news">
    <h3><?php echo $heading_title; ?> <a href="<?php echo $more_action; ?>"><?php echo $text_more; ?></a></h3>
    <?php if($news) { ?>
    <div class="news-box" style="height: <?php echo $height.'px'; ?>">
        <ul class="list-unstyled">
            <?php foreach ($news as $press) { ?>
            <li>
                <a href="<?php echo $press['href']; ?>">
                    <?php if($is_cate){ ?>
                    [<?php echo(implode(',',$press['categories'])); ?>]
                    <?php } ?>
                    <?php echo $press['name']; ?>
                    <?php if($is_date){ ?>
                    <span><?php echo $press['date']; ?></span>
                    <?php } ?>
                </a>
            </li>
            <?php } ?>
        </ul>
    </div>
    <?php } ?>
</div>