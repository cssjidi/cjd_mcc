<?php echo $header; ?>
    <div class="container">
        <div class="qq_login_bind">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#noAccount" aria-controls="home" role="tab" data-toggle="tab">没有笑翁坊账号</a></li>
                <li role="presentation"><a href="#hasAccount" aria-controls="profile" role="tab" data-toggle="tab">已有笑翁坊账号</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="noAccount">
                    <form class="form-horizontal" method="post" id="noAccountForm">
                        <div class="row">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-phone"><?php echo $entry_phone; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="phone" value="13456321234" placeholder="<?php echo $text_phone; ?>" id="input-phone" class="form-control" required />
                                    <?php if(isset($error_empty_phone)){ ?>
                                        <div class="text-danger">
                                            <?php echo $error_empty_phone; ?>
                                        </div>
                                    <?php } ?>
                                    <?php if(isset($error_phone)){ ?>
                                        <div class="text-danger">
                                            <?php echo $error_phone; ?>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                                <div class="col-sm-10">
                                    <input type="password" name="password" value="123456" placeholder="<?php echo $text_password; ?>" id="input-password" class="form-control" required />
                                    <?php if(isset($error_empty_password)){ ?>
                                        <div class="text-danger">
                                            <?php echo $error_empty_password; ?>
                                        </div>
                                    <?php } ?>
                                    <?php if(isset($error_password)){ ?>
                                        <div class="text-danger">
                                            <?php echo $error_password; ?>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-confirm-password"><?php echo $entry_confirm_password; ?></label>
                                <div class="col-sm-10">
                                    <input type="password" name="confirm_password" value="123456" placeholder="<?php echo $text_confirm_password; ?>" id="input-confirm-password" class="form-control" required />
                                    <?php if(isset($error_empty_confirm_password)){ ?>
                                        <div class="text-danger">
                                            <?php echo $error_empty_confirm_password; ?>
                                        </div>
                                    <?php } ?>
                                    <?php if(isset($error_equal_password)){ ?>
                                        <div class="text-danger">
                                            <?php echo $error_equal_password; ?>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <?php echo $captcha; ?>
                        <input type="submit" id="qq_reg" value="<?php echo $button_reg; ?>" class="btn btn-primary" />
                    </form>
                </div>
                <div role="tabpanel" class="tab-pane" id="hasAccount">


                </div>
            </div>

        </div>
    </div>

<?php echo $footer; ?>

<script>
    $(function () {

        jQuery.validator.addMethod("phone", function(value, element) {
            return this.optional(element) || /^1[3|4|5|7|8]\d{9}$/.test(value);
        }, '手机号码不正确');
        $("#noAccountForm").validate({
            rules: {
                phone: {
                    required: true,
                    phone: true
                },
                password: {
                    required: true,
                    minlength: 6
                },
                confirm_password: {
                    required: true,
                    minlength: 6,
                    equalTo: "#input-password"
                },
            },
            messages: {
                phone: {
                    required: "请输入手机号码",
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码大于6个字符，由数字、字母或符号组成"
                },
                confirm_password: {
                    required: "请输入确认密码",
                    minlength: "密码大于6个字符，由数字、字母或符号组成",
                    equalTo: "两次密码输入不一致"
                },
            },
            submitHandler:function (form) {
                $.ajax({
                    type: 'POST',
                    url:'<?php echo $action; ?>',
                    data:$(form).serialize(),
                    dataType:'json'
                })
                .done(function (data) {
                    console.log(data);
                })
                .fail(function (data, textStatus, jqXHR) {
                    //console.log(data);
                });
            }
        });
        /*$('#qq_reg').click(function () {
            $.ajax({
                        type: 'POST',
                        url:'<?php echo $action; ?>',
                        data:$('#noAccountForm').serialize(),
                        dataType:'json'
                    })
                    .done(function (data) {
                        console.log(data);
                    })
                    .fail(function (data, textStatus, jqXHR) {
                        //console.log(data);
                    });
            return false;
        })*/
    })
</script>
