<?php
// Heading
$_['module_name']           = 'Product option image PRO';
$_['heading_title']         = 'LIVEOPENCART: '.$_['module_name'];
$_['text_edit']             = 'Edit '.$_['module_name'].' Module';
$_['poip_module_name']      = $_['module_name'];

// Text
$_['text_module']         = '模板';
$_['text_success']        = '成功："'.$_['module_name'].'" 设置修改完成!';
$_['text_content_top']    = '内容顶部';
$_['text_content_bottom'] = '内容底部';
$_['text_column_left']    = '左边栏';
$_['text_column_right']   = '右边栏';

// Entry
$_['entry_settings']                  = '模板设置';
$_['entry_import']                    = '导入';
$_['entry_import_description']        = '导入文件格式: XLS. 只使用第一页导入数据.
<br>第一个表行必须包含字段名称（头）: product_id, option_value_id, image (不是 product_option_id)
<br>接下来表中的行必须包含与第一行字段名相符的数据。';
$_['entry_import_nothing_before']     = '导入之前不要删除选项图片';
$_['entry_import_delete_before']      = '导入前删除所有图像选项';
$_['PHPExcelNotFound']                = '<a href="http://phpexcel.codeplex.com/" target="_blank">PHPExcel</a> 未找到。找不到文件： ';
$_['button_upload']		                = '导入文件';
$_['button_upload_help']              = '选择文件后立即启动导入';
$_['entry_server_response']           = '服务器回应';
$_['entry_import_result']             = '已处理的行/图像/跳过';
$_['entry_export']                    = '导出';
$_['button_export']		                = '导出数据';
$_['entry_export_description']        = '导出产品选项图片数据。文件格式：XLS。导出仅使用数据第一页。
<br>第一个表行必须包含字段名称（头）: product_id, option_value_id, image (不是 product_option_id)
<br>接下来表中的行必须包含与第一行字段名相符的数据。';

$_['entry_layout']        = '布局：';
$_['entry_position']      = '位置：';
$_['entry_status']        = '状态：';
$_['entry_sort_order']    = '排列顺序：';
$_['entry_sort_order_short']    = '排列:';
$_['entry_settings_default']          = '全局设置';
$_['entry_settings_yes']          = '开';
$_['entry_settings_no']          = '关';

$_['entry_options_images_edit']       = '选项图片编辑';
$_['entry_options_images_edit_help']  = '设置编辑选项图像的方法';
$_['entry_options_images_edit_v0']    = '选项图片（编辑“选项”选项卡）';
$_['entry_options_images_edit_v1']    = '图片选项（编辑“图片”选项卡）';

$_['entry_img_use_v0']          = '关';
$_['entry_img_use_v1']          = '全开';
$_['entry_img_use_v2']          = '打开已选';

$_['entry_img_first_v0']          = '普通';
$_['entry_img_first_v1']          = '用第一个选项图片替换';
$_['entry_img_first_v2']          = '添加到选项图片组';

// Entry Module Settings
$_['entry_img_change']          = '选中选项时替换主要产品图片';
$_['entry_img_change_help']     = '选中选项值时，改变产品页面上的主要产品图片（使用第一个选项图片）';
$_['entry_img_hover']           = '鼠标悬停时，更改主要产品图片';
$_['entry_img_hover_help']      = '鼠标悬停附加图片时，改变产品页面上的主要产品图片';
$_['entry_img_main_to_additional']           = '主要图片附加';
$_['entry_img_main_to_additional_help']      = '把产品主要图片添加到附加图片列表';

$_['entry_img_use']             = '选项图片当作附加图片';
$_['entry_img_use_help']        = '在产品页面上附加产品图片列表中显示选项图片';

$_['entry_img_limit']           = '过滤附加图片';
$_['entry_img_limit_help']      = '在产品页面的附加产品图片列表中，只显示适合选项值的选项图片<br>
仅适用于"'.$_['entry_img_use'].'"功能';
$_['entry_img_gal']             = '过滤产品图片库';
$_['entry_img_gal_help']        = '在产品页面的产品图片廊中只显示附加产品图片列表中可见的图片。推荐与"'.$_['entry_img_use'].'" 和 "'.$_['entry_img_limit'].'"功能一起使用';
$_['entry_img_option']          = '选项下的图片';
$_['entry_img_option_help']     = '选中选项值时，显示在选项值（选择/单选/复选框）之下的选项图片';
//$_['entry_img_select']          = '选择选项图片';
//$_['entry_img_select_help']     = '点击相应选项的标签自动选择选项，并把单词“选择”添加到产品列表中的图片下方';
$_['entry_img_category']        = '产品列表选项';
$_['entry_img_category_help']   = '在类别页面，制造商页面，以及标准模块“最新产品”，“畅销产品”，“特价产品”，“特性产品”中的产品列表，显示带预览缩略图的选项图片。';
//$_['entry_img_sort']            = '图片排序';
//$_['entry_img_sort_help']       = '根据所说的顺序排列图片，不考虑相关联的选项';
$_['entry_img_first']           = '标准选项图片';
$_['entry_img_first_help']      = '使用添加到选项页的标准选项图片（ 目录 分类菜单 - 选项 - 等 ）';
$_['entry_img_cart']            = '购物车中的选项图片';
$_['entry_img_cart_help']       = '在购物车中显示选中的选项图片 ';

$_['entry_show_settings']       = '显示当前产品选项单个设置';
$_['entry_hide_settings']       = '隐藏当前产品选项单个设置';
$_['entry_show_hide']           = '显示/隐藏';
$_['entry_img_radio_checkbox']  = '显示单选和复选框的缩略图';
$_['entry_img_radio_checkbox_help']  = '像显示“图像”选项一样，显示“单选”和“复选框”的缩略图（自定义主题的兼容性不保证）';
$_['entry_dependent_thumbnails']= '从属缩略图';
$_['entry_dependent_thumbnails_help']= '根据其它选项的选择更改选项缩略图';

$_['text_update_alert']     = '(新版本可用)';

$_['entry_about'] = '关于';
$_['module_description']    = '模块允许用图片设置产品选项的值，并使用这些图像改善前端的产品视图。
<br>依据选择的选项改变产品图片，
<br>鼠标悬停附加图片时，改变产品图片，
<br>显示单独的选项缩略图，替代标准的，等等。
<br>兼容选项类型：“选择”，“单选”，“图像”，“复选框”。
<span class="help-block">必选<a href="http://github.com/vqmod/vqmod" target="_blank">vQmod 2.6.1 或者以上版本</a> </span>';





$_['text_conversation'] = '我们为您开放对话。 如果您需要修改或整合我们的模块，增加新的功能或开发新的模块，请发邮件给我们 <b>support@liveopencart.com</b>.';

$_['entry_we_recommend'] = '我们也建议：';
$_['text_we_recommend'] = '
<ul>
<li>
<a href="http://www.opencart.com/index.php?route=extension/extension/info&extension_id=20835" title="Live Price for OpenCart" target="_blank">
Live Price</a> - 在产品页面上的动态价格更新，取决于目前客户选择的数量和选项（完全兼容于相关选项）。
</li>
<li>
<a href="http://www.opencart.com/index.php?route=extension/extension/info&extension_id=20902" title="Related Options for OpenCart" target="_blank">
Related Options</a> - 创建相关产品选项的组合和设定库存、价格模组等。对于这些组合，含有相互关联的选项，此功能用于产品销售是很有用的，例如衣服的大小和颜色。
</li>
</ul>
';
$_['module_copyright'] = '"'.$_['module_name'].'". 是一个商业扩展。 出售或转让给其他用户是不允许的。
<br>你可以在一个网站上使用购买的这个模块。
如果你想在多个网站使用该模块，您应该购买为每个站点的单独副本。
<br>感谢您购买本模块。
';

// Error
$_['error_permission']    = '警告：您没有权限修改模块 "'.$_['module_name'] .'"！';


$_['module_info'] = '"'.$_['module_name'] .'" v %s | Developer: <a href="http://liveopencart.com" target="_blank">liveopencart.com</a> | Support: support@liveopencart.com | ';
$_['module_page'] = '<a href="http://www.opencart.com/index.php?route=extension/extension/info&amp;extension_id=21188" target="_blank"
title="Product Option Image PRO on opencart.com">Product Option Image PRO on opencart.com</a>
';


?>