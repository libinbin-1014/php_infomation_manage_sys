<?php

include_once ("connect.php");

$action = $_GET['action'];
if ($action=='export') { //导出CSV
    $result = mysql_query("select * from address_list");
	$str = "姓名,性别,部门,职位,电话,地址\n";
    $str .= iconv('utf-8','gb2312',$str);
	echo $row;
    while($row=mysql_fetch_array($result)){
        $name = iconv('utf-8','gb2312',$row['name']);
        $sex = iconv('utf-8','gb2312',$row['sex']);
		$deparyment = iconv('utf-8','gb2312',$row['deparyment']);
		$position  = iconv('utf-8','gb2312',$row['position']);
		$tel  = iconv('utf-8','gb2312',$row['tel']);
		$address   = iconv('utf-8','gb2312',$row['address']);
		$str .=$name.",".$sex.",".$deparyment.",".$position.",".$tel.",".$address.","."\n";
    }
    $filename = "企业通讯录-".date('Ymd').'.csv';
    export_csv($filename,$str);
}

function export_csv($filename,$data) {
    header("Content-type:text/csv");
    header("Content-Disposition:attachment;filename=".$filename);
    header('Cache-Control:must-revalidate,post-check=0,pre-check=0');
    header('Expires:0');
    header('Pragma:public');
    echo $data;
}
?>