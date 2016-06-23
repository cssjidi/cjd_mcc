<?php echo $header; ?>
    <div class="container">
        <div class="qq-login-box">
            <div class="qq-info">
                <img src="<?php echo $qq_face; ?>" alt="">
                <h2>
                    <?php echo $text_qq_welcome; ?>：<span><?php echo $fullname; ?></span>
                </h2>
            </div>
        <div class="qq-login-bind">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#noAccount" aria-controls="home" role="tab" data-toggle="tab">没有笑翁坊账号</a></li>
                <li role="presentation"><a href="#hasAccount" aria-controls="profile" role="tab" data-toggle="tab">已有笑翁坊账号</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="noAccount">
                    <form class="form-horizontal" method="post" id="noAccountForm">
                        <input type="hidden" value="<?php echo $fullname; ?>" name="fullname" />
                        <input type="hidden" value="0" name="bind">
                        <div class="row">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="email" value="" placeholder="<?php echo $text_email; ?>" id="input-email" class="form-control" required />
                                    <label class="error_email" for="input-email"></label>
                                    <span class="tips"><?php echo $entry_email; ?></span>
                                </div>

                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-phone"><?php echo $entry_phone; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="telephone" value="" placeholder="<?php echo $text_phone; ?>" id="input-phone" class="form-control" required />
                                    <label class="error_phone" for="input-phone"></label>
                                    <span class="tips"><?php echo $entry_phone; ?></span>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                                <div class="col-sm-10">
                                    <input type="password" name="password" value="" placeholder="<?php echo $text_password; ?>" id="input-password" class="form-control" required />
                                    <label class="error_password" for="input-password"></label>
                                    <span class="tips"><?php echo $entry_password; ?></span>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-confirm-password"><?php echo $entry_confirm_password; ?></label>
                                <div class="col-sm-10">
                                    <input type="password" name="confirm_password" value="" placeholder="<?php echo $text_confirm_password; ?>" id="input-confirm-password" class="form-control" required />
                                    <label class="error_confirm_password" for="input-confirm-password"></label>
                                    <span class="tips"><?php echo $entry_confirm_password; ?></span>
                                </div>
                            </div>
                            <?php echo $captcha; ?>
                        </div>
                        <input type="submit" id="qq_reg" value="<?php echo $button_reg; ?>" class="btn btn-primary btn-block" />
                    </form>
                </div>
                <div role="tabpanel" class="tab-pane" id="hasAccount">
                    <form class="form-horizontal" method="post" id="hasAccountForm">
                        <input type="hidden" value="<?php echo $fullname; ?>" name="fullname" />
                        <input type="hidden" value="1" name="bind">
                        <div class="row">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-has-email"><?php echo $entry_email; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="email" value="" placeholder="<?php echo $text_email; ?>" id="input-email" class="form-control" required />

                                    <div class="tips">
                                        <?php echo $text_email; ?>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-has-password"><?php echo $entry_password; ?></label>
                                <div class="col-sm-10">
                                    <input type="password" name="password" value="" placeholder="<?php echo $text_password; ?>" id="input-has-password" class="form-control" required />

                                    <div class="tips">
                                        <?php echo $text_password; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="submit" id="qq_bind" value="<?php echo $button_bind; ?>" class="btn btn-primary btn-block" />
                    </form>

                </div>
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
                email: {
                    required: true,
                    email:true
                },
                telephone: {
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
                captcha:{
                    required: true,
                }
            },
            messages: {
                email: {
                    required: '请输入邮箱地址',
                    email:'邮箱地址不正确'
                },
                telephone: {
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
                captcha:{
                    required: '验证码不能为空',
                }
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
                    if(data['status'] === 200){
                        var msg = typeof data['msg'] !== 'object' ? parseJSON(data['msg']): data['msg'];
                        console.log(msg);
                        $.each(msg,function (index,value) {
                            var len = $('.'+index).length;
                            if(len > 0){
                                $('.'+index).text(value).addClass('error').show();
                                //console.log($('.'+index).text());
                            }else if(index == 'captcha'){
                                if($('#error_captcha').length > 0){
                                    $('#error_captcha').remove();
                                }
                                var html = '<label id="error_captcha" class="error" for="input-captcha" style="display: block">'+value+'</label>';
                                $('#input-captcha').parent().append(html);
                            }
                        });
                        if(msg['success']){
                            var html = '<p class="alert alert-success">注册成功，正在跳转到用户中心</p>';
                            $('#qq_reg').before(html);
                            setTimeout(function () {
                                window.location.href = msg['redirect'];
                            },500)
                        }
                    }
                })
                .fail(function (data, textStatus, jqXHR) {
                    //console.log(data);
                });
            }
        });
        $("#hasAccountForm").validate({
            rules: {
                email: {
                    required: true,
                    email:true
                },
                password: {
                    required: true,
                    minlength: 6
                },
            },
            messages: {
                email: {
                    required: '请输入邮箱地址',
                    email:'邮箱地址不正确'
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码大于6个字符，由数字、字母或符号组成"
                },
            },
            submitHandler:function (form) {
                $.ajax({
                            type: 'POST',
                            url:'<?php echo $bind_action; ?>',
                            data:$(form).serialize(),
                            dataType:'json'
                        })
                        .done(function (data) {
                            console.log(data);
                            if(data['status'] === 200){
                                var msg = typeof data['msg'] !== 'object' ? parseJSON(data['msg']): data['msg'];
                                if(msg['success']){
                                    var html = '<p class="alert alert-success">绑定成功，正在跳转到用户中心</p>';
                                    $('#qq_bind').before(html);
                                    setTimeout(function () {
                                        window.location.href = msg['redirect'];
                                    },500)

                                }
                            }
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
