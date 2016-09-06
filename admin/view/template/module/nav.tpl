<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">


                <div class="col col-sm-3 col-lg-3 col-md-3">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <?php echo $text_post; ?>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <ul class="list-group">
                                        <?php foreach($informations as $info){ ?>
                                            <li class="list-group-item">
                                                <div class="form-group">
                                                    <input type="checkbox" name="selected[]" value="<?php echo $info['id']; ?>">
                                                    <input type="hidden" value="<?php echo $info['href']; ?>" id="<?php echo $info['id']; ?>"/>
                                                    <span><?php echo $info['title']; ?></span>
                                                    <input type="text" placeholder="<?=$text_icon;?>" class="pull-right"/>
                                                </div>
                                            </li>
                                        <?php } ?>
                                    </ul>
                                    <div class="pull-left">
                                        <input type="checkbox" onclick="$('input[name=\'selected[]\']').prop('checked', this.checked);"><a href="javascript:void(0);" class=""><?=$text_select_all;?></a>
                                    </div>
                                    <div class="pull-right">
                                        <button type="button" class="btn btn-sm btn-primary btn-add-menu"><?=$text_add_menu;?></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <?php echo $text_cate; ?>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body">
                                    <ul class="list-group">
                                        <?php foreach($categories as $cate){ ?>
                                        <li class="list-group-item">
                                            <div class="form-group">
                                                <input type="checkbox" name="selected2[]" value="<?php echo $info['id']; ?>">
                                                <input type="hidden" value="<?php echo $cate['href']; ?>" id="<?php echo $cate['id']; ?>"/>
                                                <span><?php echo $cate['name']; ?></span>
                                                <input type="text" placeholder="<?=$text_icon;?>" class="pull-right"/>
                                            </div>
                                        </li>
                                        <?php } ?>
                                    </ul>
                                    <div class="pull-left">
                                        <input type="checkbox" onclick="$('input[name=\'selected2[]\']').prop('checked', this.checked);"><a href="javascript:void(0);" class="select-all" ><?=$text_select_all;?></a>
                                    </div>
                                    <div class="pull-right">
                                        <button type="button" class="btn btn-sm btn-primary btn-add-menu"><?=$text_add_menu;?></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <?php echo $text_link; ?>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <div class="my-link">
                                        <div class="form-group">
                                            <label for="exampleInputName2"><?=$text_url?></label>
                                            <input type="text" class="form-control" id="myUrl" placeholder="<?=$text_url?>">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputName2"><?=$text_mylink?></label>
                                            <input type="text" class="form-control" id="myLink" placeholder="<?=$text_mylink?>">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputName2"><?=$text_icon?></label>
                                            <input type="text" class="form-control" id="myIcon" placeholder="<?=$text_icon?>">
                                        </div>
                                        <div class="pull-right">
                                            <button type="button" class="btn btn-sm btn-primary btn-my-menu"><?=$text_add_menu;?></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col col-sm-9 col-lg-9 col-md-9">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" name="nav-form" id="nav-form" class="form-horizontal">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <div class="row" style="line-height:35px;height:35px;">
                                    <label class="col-sm-4" for="input-status">
                                        <i class="fa fa-list"></i>&nbsp;<?php echo $text_nav;; ?>
                                    </label>
                                    <div class="col-sm-4">
                                        <input type="hidden" name="name" value="nav">
                                        <select name="status" id="input-status" class="form-control">
                                            <?php if ($nav_status) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                        </select>
                                        <textarea name="setting" id="setting" style="display: none;">

                                        </textarea>
                                     </div>
                                    <div class="col-sm-4">
                                        <div class="pull-left">
                                            <button style="margin-top:-5px;" type="submit" id="btn-save" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary btn-small"><i class="fa fa-save"></i>&nbsp;<?php echo $button_save; ?></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="panel-body">
                            <h3><?php echo $text_code; ?></h3>
                            <p>
                                <?php echo $text_desc; ?>
                            </p>
                            <div class="menu-list">
                                <div class="dd" id="nestable">
                                    <ol class="dd-list">


                                    </ol>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">

                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>

<?php echo $footer; ?>
<script>
    $(document).ready(function(){
        cjdMenu.options.items = <?php echo trim($setting);?>;
        cjdMenu.init();
    });
</script>