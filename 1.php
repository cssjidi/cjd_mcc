<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<form id="addform" action="1.php?action=import" method="post" enctype="multipart/form-data">
    <p>请选择要导入的CSV文件：<br/><input type="file" name="file"> <input type="submit"
                                                                class="btn" value="导入CSV">
        <input type="button" class="btn" value="导出CSV" onclick="window.location.href='1.php?
    action=export'"></p>
</form>
</body>
</html>

<?php

require_once( 'system/PHPExcel/Classes/PHPExcel.php' );

require_once( 'excel.php' );

//默認的分隔符
//測試
$file='78.csv';
//$handle = fopen($file,'r');
if (($handle = fopen_utf8($file, "r")) === FALSE) return;

$count=0;
$row = 1;
setlocale(LC_ALL, 'zh_CN'); //设置地区信息（地域信息）
$array=array();
//echo mb_detect_encoding($_FILES['file']['tmp_name']);
while ($data = fgetcsv($handle, 10000000, ",")) {
    $num = count($data);
    echo "<p> $num fields in line $row: <br> ";
    $row++;
    for ($c=0; $c < $num; $c++) {
        //$text = iconv('UTF-8', 'gb2312', $data[$c]);
        //$text = mb_convert_encoding($data[$c], "UTF-8", "GBK");
        echo $data[$c];
        $array[] = $data[$c];
    }
}
echo '<br/>';echo '<br/>';echo '<br/>';echo '<br/>';echo '<br/>';echo '<br/>';echo '<br/>';echo '<br/>';
$mm = explode('	',$array[2]);
var_dump($mm[3]);
echo '<br/>';
var_dump($array[3]);
exit;
/*$file = "xcrj1.csv"

$type = strtolower( pathinfo($file, PATHINFO_EXTENSION) );

//$path = 'C:/Users/may/Desktop/'.$file;
$path = __DIR__.'/'.$file;*/




// parse uploaded spreadsheet file
//$inputFileType = PHPExcel_IOFactory::identify($filename);
//die($inputFileType);
//$objReader = PHPExcel_IOFactory::createReader('CSV');
//$objReader->setReadDataOnly(true);
//$reader = $objReader->load($path);
//echo '<pre>';print_r($reader);echo '</pre>';
define('DIR_IMAGE', 'D:/www/mycncart/src/image/');
$action = isset($_GET['action']) ? $_GET['action'] : '';
if ($action == 'import') { //导入CSV

$upload = DIR_IMAGE.$_FILES['file']['name'];
if(is_file($upload)){
    @unlink($upload);
}

$is_uploaded = move_uploaded_file($_FILES['file']['tmp_name'],$upload);

if($is_uploaded) {
    // parse uploaded spreadsheet file
    //$inputFileType = PHPExcel_IOFactory::identify($filename);
    //$objReader = PHPExcel_IOFactory::createReader('CSV');
    //$objReader->setReadDataOnly(true);
    //echo $objReader->setInputEncoding('gbk');
    //$reader = $objReader->load($upload);
    //选择标签页

   /* $handle = fopen($upload, 'r');
    $result = input_csv($handle); //解析csv
    $len_result = count($result);
    if($len_result==0){
        echo '没有任何数据！';
        exit;
    }
    for ($i = 1; $i < $len_result; $i++) { //循环获取各字段值
        $name = iconv('gb2312', 'utf-8', $result[$i][0]); //中文转码
        $sex = iconv('gb2312', 'utf-8', $result[$i][1]);
        $age = $result[$i][2];
        $data_values .= "('$name','$sex','$age'),";
    }
    $data_values = substr($data_values,0,-1); //去掉最后一个逗号
    fclose($handle); //关闭指针
    var_dump($data_values);*/
    /*$sheet = $reader->getActiveSheet();

//获取行数与列数,注意列数需要转换
    $highestRowNum = $sheet->getHighestRow();
    $highestColumn = $sheet->getHighestColumn();
    $highestColumnNum = PHPExcel_Cell::columnIndexFromString($highestColumn);

//取得字段，这里测试表格中的第一行为数据的字段，因此先取出用来作后面数组的键名
    $filed = array();
    for ($i = 0; $i < $highestColumnNum; $i++) {
        $cellName = PHPExcel_Cell::stringFromColumnIndex($i) . '1';
        $cellVal = $sheet->getCell($cellName)->getValue();//取得列内容
        $filed [] = $cellVal;
    }*/
    /*
    $excelData =  array();
$worker = $reader->getActiveSheet();
    $highestRow = $worker->getHighestRow();

    $highestColumn = $worker->getHighestColumn();
    //echo $highestColumn;
    for($row=1;$row<=$highestRow;$row++){
        //echo $row;
        for($col=0;$col<=$highestColumn;$col++){
            $excelData[$row][] = (string)$worker->getCellByColumnAndRow($col, $row)->getValue();
        }
    }
    */
/*    $objReader = PHPExcel_IOFactory::createReader('CSV')->setDelimiter(',')
                                                        ->setEnclosure('"')
                                                        ->setSheetIndex(0);
    $objPHPExcelFromCSV = $objReader->load($upload);

    $objWriter2007 = PHPExcel_IOFactory::createWriter($objPHPExcelFromCSV, 'Excel2007');
    $objWriter2007->save(str_replace('.php', '.xlsx', __FILE__));

    echo '<pre>';
    print_r($objPHPExcelFromCSV);
    echo '<pre>';*/
}

        //$filename = $_FILES['file']['tmp_name'];
        //echo $filename;
    //$inputFileType = PHPExcel_IOFactory::identify($filename);
    //echo $inputFileType;
    //echo $_FILES['file'];
    //$filename1=explode(".",$_FILES['file']['name']);//把上传的文件名以“.”好为准做一个数组。
    //$time=date("y-m-d-H-i- s");//去当前上传的时间
    //$filename1[0]='xcrj1';//取文件名t替换
    //$name=implode (".",$filename1); //上传后的文件名
    //$uploadfile=$name;//上传后的文件名地址


    //move_uploaded_file() 函数 将上传的文件移动到新位置。若成功，则返回 true，否则返回 false。
    //$result=move_uploaded_file($_FILES['file']['tmp_name'],$uploadfile);//假如上传到当前目录下

    //die($result);
    //$objReader = PHPExcel_IOFactory::createReader('CSV');
    ///$objReader->setReadDataOnly(true);
    //echo $_FILES['file']['type'];
    //var_dump($_FILES['file']['name']);
    //$reader = $objReader->load($uploadfile);
   // echo '<pre>';print_r($reader);echo '</pre>';
    //var_dump($reader);


        //$result = input_csv($handle); //解析csv
        //$len_result = count($result);

        //if($len_result==0){
        //    echo '没有任何数据！';
        //    exit;
        //}
    $file = DIR_IMAGE.'78.csv';
    //$handle = fopen($file, 'r');
    if (($handle = fopen_utf8($file, "r")) === FALSE) return;
    $csv_reader = new ReadCSV( $file_handle, IS_IU_CSV_DELIMITER, "\xEF\xBB\xBF" ); // Skip any UTF-8 byte order mark.
    //$data = fgetcsv($handle,10000);
//    fwrite($handle,chr(0xEF).chr(0xBB).chr(0xBF));
//    foreach ($contens as $content){
//        fputcsv($handle,$content);
//    }

    $count=0;
    $row = 1;
    setlocale(LC_ALL, 'zh_CN'); //设置地区信息（地域信息）
    $array=array();
    //echo mb_detect_encoding($_FILES['file']['tmp_name']);
    while ($data = fgetcsv($handle, 1000, ",")) {
        $num = count($data);
        echo "<p> $num fields in line $row: <br> ";
        $row++;
        for ($c=0; $c < $num; $c++) {
            $text = iconv('UTF-8', 'gb2312', $data[$c]);
            //$text = mb_convert_encoding($data[$c], "UTF-8", "GBK");
            echo $data[$c] . "<br> ";
        }
    }



    //var_dump(iconv('gb2312', 'utf-8',));
    fclose($handle);
    exit;
      for ($i = 1; $i < $len_result; $i++) { //循环获取各字段值
            $name = iconv('gb2312', 'utf-8', $result[$i][0]); //中文转码
            $sex = iconv('gb2312', 'utf-8', $result[$i][1]);
            $age = $result[$i][2];
            $data_values .= "('$name','$sex','$age'),";
        }
        $data_values = substr($data_values,0,-1); //去掉最后一个逗号
        //var_dump($result);


} elseif ($action=='export') { //导出CSV
    //导出处理
}
function input_csv($handle) {
    $out = array ();
    $n = 0;
    while ($data = fgetcsv($handle, 10000)) {
        $num = count($data);
        for ($i = 0; $i < $num; $i++) {
            $out[$n][$i] = $data[$i];
        }
        $n++;
    }
    return $out;
}


function fopen_utf8($filename)
{
    $encoding = '';
    $handle = fopen($filename, 'r');
    $bom = fread($handle, 2);
//    fclose($handle);
    rewind($handle);

    if ($bom === chr(0xff) . chr(0xfe) || $bom === chr(0xfe) . chr(0xff)) {
        // UTF16 Byte Order Mark present
        $encoding = 'UTF-16';
    } else {
        $file_sample = fread($handle, 1000) + 'e'; //read first 1000 bytes
        // + e is a workaround for mb_string bug
        rewind($handle);

        $encoding = mb_detect_encoding($file_sample, 'UTF-8, UTF-7, ASCII, EUC-JP,SJIS, eucJP-win, SJIS-win, JIS, ISO-2022-JP, ISO-8859-1, GBK, GB2312, UNICODE,  BIG5');
    }
    if ($encoding) {
        stream_filter_append($handle, 'convert.iconv.' . $encoding . '/UTF-8');
    }
    return ($handle);
}

?>



