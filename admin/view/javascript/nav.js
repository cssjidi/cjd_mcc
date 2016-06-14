'use strict';
var cjdMenu ;
(function($) {
    var api;
    api = cjdMenu = {
        options : {
            items:''
        },
        _init:function () {
            var self = this;
            if(api.options.items !== ''){
                $.each(api.options.items, function (index, item) {
                    $('#nestable>ol').append(self.buildMenu(item));
                });
                $('#nestable').nestable();
                this.updateOut();
            }else{
                this.menuList = api.options.items;
                $('#setting').val(this.menuList);
            }
        },
        init:function () {
            var self = this;
            this._init();
            this.element();
            this.bind();

        },
        element:function () {
            this.$add_menu = '.btn-add-menu';                  //添加到菜单
            this.$add_my_menu = '.btn-my-menu';                //自定义链接添加到菜单
            this.$edit_form = '.nav-group-list input';         //右侧表单
            this.$btn_close = $('.close-list');                //删除菜单
            this.$down_list = $('.down-list');                 //展开菜单
            this.$nav_from = $('#nav-form');                   //表单名称
            this.$nav_group = $('.nav-group-list');            //菜单组
            this.$menu_list = '.menu-list>#nestable>.dd-list'; //
            this.$nestable = $('#nestable');
        },
        bind: function () {
            var self = this;
            this.addMenu();
            //this.changeForm();
            $(document).delegate(this.$edit_form,'change', function () {
                var that = $(this);
                self.changeForm(event);
            });
            this.$nestable.nestable().on('change', self.updateMenu);
        },
        addMenu:function () {
            var self = this;
            //添加菜单
            $(this.$add_menu).on('click',function () {
                var that = $(this);
                that.parent().parentsUntil('.in').find('input[name^="selected"]').each(function(){
                    var html = '';
                    if($(this).prop('checked')){
                        var icon = $(this).parent().find('input:text').val(),
                            title = $(this).parent().find('span').text(),
                            url = $(this).parent().find('input:hidden').val();
                        var html = self.menuDom(title,url,icon);
                        $(self.$menu_list).append(html);
                        self.updateOut();
                    }
                    $(this).prop('checked',false);
                    that.parent().prev().find('input:checkbox').prop('checked',false);
                });
                $('html, body').animate({scrollTop: '0px'},500);
            });
            //添加自定义菜单
            $(this.$add_my_menu).on('click',function(){
                var url = $('#myUrl').val(),
                    icon = $('#myIcon').val(),
                    title = $('#myLink').val(),
                    that = this;
                if(url == '' || title == ''){
                    return false;
                }
                var html = self.menuDom(title,url,icon);
                $(self.$menu_list).append(html);
                self.updateOut();
            });
        },
        delMenu:function (obj) {
            var self = $(obj);
            var html = '<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>至少要保留一个菜单<button type="button" class="close" data-dismiss="alert">&times;</button> </div>';
            var del_html = self.parent().html();

            if($('#nestable>ol').children().size() == 1){
                $('.alert.alert-danger').remove();
                $('.container-fluid').eq(1).prepend(html);
            }else{
                if(self.parent().parent().parent().parent().children().eq(0).data('action') == 'collapse'){
                    self.parent().parent().parent().parent().children().eq(0).remove();
                    self.parent().parent().parent().remove();
                }else {
                    self.parent().parent().remove();
                }
            }
            this.updateOut();
        },
        dropdownMenu:function (e) {
            var self = $(e),
                title = self.parent().parent().data('title'),
                icon = self.parent().parent().data('icon'),
                link = self.parent().parent().data('link'),
                html = '<div class="nav-group-list"><div class="form-group"><label for="">标题</label><input data-type="title" type="text" class="form-control edit-title" placeholder="标题" value="'+title+'"></div><div class="form-group"><label for="">链接</label><input data-type="link" type="text" class="form-control edit-link" placeholder="链接" value="'+link+'"></div><div class="form-group"><label for="">图标样式</label><input type="text" class="form-control edit-icon" placeholder="图标样式" data-type="icon" value="'+icon+'"></div> <div class="pull-right"></div></div></div>';

            if(self.hasClass('open')){
                this.$nav_group.prev().remove();
                self.parent().find('.nav-group-list').remove();
                self.removeClass('open').addClass('fa-angle-double-down').removeClass('fa-angle-double-up');
            }else{
                this.$nav_group.prev().removeClass('open').removeClass('fa-angle-double-up').addClass('fa-angle-double-down');
                this.$nav_group.prev().remove();
                self.addClass('open').addClass('fa-angle-double-up').removeClass('fa-angle-double-down');
                self.after(html);
            }
            //});
        },
        updateMenu:function (e) {
            var list = e.length ? e : $(e.target),
                output = list.data('output');
            api.options.items = output;
            console.log(output.val());
            if (window.JSON) {
                output.val(window.JSON.stringify(list.nestable('serialize'))); //, null, 2));
            } else {
                output.val('浏览器不支持此函数');
            }
        },
        updateOut:function () {
            this.updateMenu($('#nestable').data('output', $('#setting')));
        },
        changeForm: function (event) {
            var self = $(event.target),
                type = self.data('type');
            if(type == 'title'){
                self.parents('.dd3-content').find('.dd-title').text(self.val());
            }
            self.parent().parent().parent().parent('.dd-item').data(type,self.val());
            this.updateOut();
        },
        menuDom:function (title,url,icon) {
            return  '<li class="dd-item dd3-item" data-title="'+ title +'" data-icon="'+ icon +'" data-link="'+ url +'"><div class="dd-handle dd3-handle" ></div><div class="dd3-content"><span class="dd-title">' + title + '</span><button type="button" class="fa fa-times pull-right close-list" onclick="cjdMenu.delMenu(this)"></button><button type="button" class="fa fa-angle-double-down pull-right down-list" onclick="cjdMenu.dropdownMenu(this);"></button></div></li>';
        },
        buildMenu:function (item) {
            var self = this;
            var html = '<li class="dd-item dd3-item" data-title="' + item['title'] + '" data-icon="' + item['icon'] + '" data-link="' + item['link'] + '">';
            html += '<div class="dd-handle dd3-handle"></div><div class="dd3-content"><span class="dd-title">' + item['title'] + '</span><button type="button" class="fa fa-times pull-right close-list" onclick="cjdMenu.delMenu(this)"></button><button type="button" class="fa fa-angle-double-down pull-right down-list" onclick="cjdMenu.dropdownMenu(this);"></button></div>';

            if (item.children) {

                html += "<ol class='dd-list'>";
                $.each(item.children, function (index, sub) {
                    html += self.buildMenu(sub);
                });
                html += "</ol>";

            }

            html += "</li>";

            return html;
        }
    }
    

}(jQuery));

