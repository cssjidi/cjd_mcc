<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-carousel" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-carousel" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sum-title"><?php echo $entry_sum_title; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sum_title" value="<?php echo $sum_title; ?>" placeholder="<?php echo $entry_sum_title; ?>" id="input-sum-title" class="form-control" />
              <?php if ($error_sum_title) { ?>
              <div class="text-danger"><?php echo $error_sum_title; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-news-col"><?php echo $entry_news_col; ?></label>
            <div class="col-sm-10">
              <input type="text" name="news_col" value="<?php echo $news_col; ?>" placeholder="<?php echo $entry_news_col; ?>" id="input-news-col" class="form-control" />
              <?php if ($error_news_col) { ?>
              <div class="text-danger"><?php echo $error_news_col; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cate"><?php echo $entry_cate; ?></label>
            <div class="col-sm-10">
              <select name="cate_id" id="input-cate" class="form-control">
                <?php foreach ($news_cates as $news_cate) { ?>
                <?php if ($news_cate['press_category_id'] == $cate_id) { ?>
                <option value="<?php echo $news_cate['press_category_id']; ?>" selected="selected"><?php echo $news_cate['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $news_cate['press_category_id']; ?>"><?php echo $news_cate['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" name="date_status" id="input-status" for="input-width"><?php echo $entry_other; ?></label>
            <div class="col-sm-10">
              <label class="checkbox-inline">
                <input type="checkbox" id="input-cate-status" name="is_cate" value="1" <?php echo $is_cate?'checked':''; ?>> <?php echo $entry_cate_status; ?>
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="input-carousel" name="is_carousel" value="1" <?php echo $is_carousel?'checked':''; ?>> <?php echo $entry_carousel; ?>
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="input-date" name="is_date" value="1" <?php echo $is_date?'checked':''; ?>> <?php echo $entry_date; ?>
              </label>
            </div>
          </div>

          <div class="form-group" id="show_date_format" style="display: none;">
            <label class="col-sm-2 control-label" for="input-date-format"><?php echo $entry_date_format; ?></label>
            <div class="col-sm-10">
              <select name="date_format" id="input-date-format" class="form-control">
                <option value="1" selected="selected">2000-01-10</option>
                <option value="2">2016/01/10</option>
                <option value="3">01/10/2016</option>
                <option value="4">16-01-10</option>
                <option value="5">16/01/10</option>
              </select>
            </div>
          </div>

          <div class="form-group" style="display: none;">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>