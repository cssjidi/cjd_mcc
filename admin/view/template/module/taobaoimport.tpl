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
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" form="form-backup" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-exchange"></i> <?php echo $heading_title; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="upform" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-import"><?php echo $text_select_file_to_import; ?></label>
                        <div class="col-sm-10">
                            <input type="file" name="upload" id="upload" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-import">&nbsp;</label>
                        <div class="col-sm-10">
                            <a class="btn btn-primary btn-lg" onclick="upload();"><span><?php echo $button_import; ?></span></a>
                        </div>
                    </div>


                </form>

                <form action="" method="post" enctype="multipart/form-data" id="form-product">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                                <thead>
                                        <tr>
                                            <td style="width: 1px;" class="text-center">
                                                <input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
                                            </td>
                                            <td class="text-center">
                                                <?php echo $t_title; ?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo $t_model; ?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo $t_seo; ?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo $t_picture; ?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo $t_attributes; ?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo $t_options; ?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo $t_opera; ?>
                                            </td>
                                        </tr>
                                </thead>
                                <tbody>
                                <?php foreach($file_data as $index=>$p_data){ ?>
                                <?php if($index > 1){ ?>
                                <tr style="display: none;">
                                    <td style="width: 1px;" class="text-center">
                                        <input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
                                    </td>
                                    <td class="text-center" style="overflow: hidden;height:30px;width:9%;">
                                        <?php echo $p_data[0] ?>
                                    </td>
                                    <td class="text-center" style="overflow: hidden;height:30px;width:9%;">
                                        <?php echo $p_data[7] ?>
                                    </td>
                                    <td class="text-center" style="overflow: hidden;height:30px;width:9%;">
                                        <textarea name="" id="" cols="30" rows="10" style="display: none;">
                                            <?php echo $p_data[20] ?>
                                        </textarea>
                                    </td>
                                    <td class="text-center" style="overflow: hidden;height:30px;width:9%;">
                                        <?php echo $p_data[21] ?>
                                    </td>
                                    <td class="text-center" style="overflow: hidden;height:30px;width:9%;">
                                        <?php echo $p_data[28] ?>
                                    </td>
                                    <td class="text-center" style="overflow: hidden;height:30px;width:9%;">
                                        <?php echo $p_data[33] ?>
                                    </td>
                                    <td class="text-center" style="overflow: hidden;height:30px;width:9%;">
                                        <?php echo $p_data[48] ?>
                                    </td>
                                    <td class="text-center" style="overflow: hidden;height:30px;width:9%;">
                                        <?php echo $p_data[49] ?>
                                    </td>
                                    <td class="text-center" style="overflow: hidden;height:30px;width:9%;">
                                        <?php echo $p_data[50] ?>
                                    </td>
                                    <td class="text-center" style="overflow: hidden;height:30px;width:9%;">
                                        <?php echo $p_data[59] ?>
                                    </td>
                                </tr>
                                <?php } ?>
                                <?php } ?>
                                </tbody>

                        </table>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript"><!--
    $("input[value=pid]").attr("checked",true)
    $(".page").hide();
    $(".pid").show();

    $(function() {
        $("input[value=page]").click(function() {
            $(".pid").hide();
            $(".page").show(0);
        });
        $("input[value=pid]").click(function() {
            $(".page").hide();
            $(".pid").show();
        });
    });

    function checkFileSize(id) {
        // See also http://stackoverflow.com/questions/3717793/javascript-file-upload-size-validation for details
        var input, file, file_size;

        if (!window.FileReader) {

            return true;
        }

        input = document.getElementById(id);
        if (!input) {

            return true;
        }
        else if (!input.files) {

            return true;
        }
        else if (!input.files[0]) {

            alert( "<?php echo $error_select_file; ?>" );
            return false;
        }
        else {
            file = input.files[0];
            file_size = file.size;
        <?php if (!empty($post_max_size)) { ?>

                post_max_size = <?php echo $post_max_size; ?>;
                if (file_size > post_max_size) {
                    alert( "<?php echo $error_post_max_size; ?>" );
                    return false;
                }
            <?php } ?>
        <?php if (!empty($upload_max_filesize)) { ?>

                upload_max_filesize = <?php echo $upload_max_filesize; ?>;
                if (file_size > upload_max_filesize) {
                    alert( "<?php echo $error_upload_max_filesize; ?>" );
                    return false;
                }
            <?php } ?>
            return true;
        }
    }

    function upload() {
        if (checkFileSize('upload')) {
            $('#upform').submit();
        }
    }

    function isNumber(txt){
        var regExp=/^[\d]{1,}$/;
        return regExp.test(txt);
    }
    function validateDwForm(id) {
        var val = $("input[name=exportway]:checked").val();
        var min = $("input[name=min]").val();
        var max = $("input[name=max]").val();

        if(!isNumber(min) || !isNumber(max)) {
            alert("<?php echo $error_param_not_number; ?>");
            return false;
        }
        var batchNo = parseInt(<?php echo($count_product-1) ?>/parseInt(min))+1;
        var minProductId = parseInt(<?php echo($min_product_id) ?>);
        var maxProductId = parseInt(<?php echo($max_product_id) ?>);
        if(val == "page") {
            if(parseInt(max) > batchNo) {
                alert("<?php echo $error_page_no_data; ?>");
                return false;
            } else {
                $("input[name=max]").attr("value",parseInt(max)+1);
            }
        } else {
            if(parseInt(min) > maxProductId || parseInt(max) < minProductId || parseInt(min) > parseInt(max)) {
                alert("<?php echo $error_pid_no_data; ?>");
                return false;
            }
        }

        return true;
    }

    function pexport() {
        if (validateDwForm('dwform')) {
            $('#dwform').submit();

        }
    }
    //--></script>

<?php echo $footer; ?>