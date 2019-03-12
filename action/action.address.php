<?php
//====================================================
//		FileName: action.address.php
//		Summary:  通讯录信息
//====================================================
header("Content-type: text/html; charset=utf-8");

if(!defined('CORE'))exit("error!"); 

//列表
if($do==""){
	//If_rabc($action,$do); //检测权限	
	//判断检索值		
	//参数安全过滤
	$kewords = _RunMagicQuotes($_POST['kewords']);
	$numPerPage = _RunMagicQuotes($_POST['numPerPage']);
	if($kewords){$search .= " and name like '%".strip_tags($kewords)."%'";}		
	if($_POST['time_start']!="" && $_POST['time_over']!=""){
		$search .= " and `created_at` >  '".strtotime($_POST[time_start]." 00:00:00")."' AND  `created_at` <  '".strtotime($_POST[time_over] ." 23:59:59")."'";
	}
	
	//设置分页
	if($numPerPage==""){$numPerPage="10";}else{$numPerPage=$numPerPage;}
	if($_GET[pageNum]==""||$_GET[pageNum]=="0" ){$pageNum="0";}else{$pageNum=($_GET[pageNum]-1)*$numPerPage;}
	$num=mysql_query("select * from eml_address_list where 1=1 $search");//当前频道条数
	$total=mysql_num_rows($num);//总条数	
	$page=new page(array('total'=>$total,'perpage'=>$numPerPage));

	//查询
	$sql="select * from eml_address_list  where 1=1  $search order by id desc limit $pageNum,$numPerPage";

	//echo $sql;
	$db->query($sql);
	$list=$db->fetchAll();
	//echo $list;
	//模版
	$smt = new smarty();smarty_cfg($smt);
	$smt->assign('list',$list);
	$smt->assign('numPerPage',$numPerPage); //显示条数
	$smt->assign('pageNum',$_GET[pageNum]); //当前页数
	$smt->assign('total',$total);  //总条数
	$smt->assign ('page',$page->show());
	$smt->assign('title',"通讯录管理");
	$smt->display('adress_list.htm');
	exit;	
}




//新建	
if($do=="new"){	
	If_rabc($action,$do); //检测权限
	is_admin($action,$do); //检测权限
	$smt = new smarty();smarty_cfg($smt);

	//模版	
	$smt->assign('title',"添加");
	$smt->display('adress_new.htm');
	exit;
}

//写入
if($do=="add"){
	If_rabc($action,$do); //检测权限
	is_admin($action,$do); //检测权限
	$name = _RunMagicQuotes($_POST[name]);
	$sex = _RunMagicQuotes($_POST[sex]);
	$phone = _RunMagicQuotes($_POST[phone]);
	$nation = _RunMagicQuotes($_POST[nation]);
	$duty = _RunMagicQuotes($_POST[duty]);
	$idnumber = _RunMagicQuotes($_POST[idnumber]);
	$birthday = _RunMagicQuotes($_POST[birthday]);
	$address = _RunMagicQuotes($_POST[address]);
	$edu = _RunMagicQuotes($_POST[edu]);
	$title = _RunMagicQuotes($_POST[title]);
	$title_date = _RunMagicQuotes($_POST[title_date]);
	$skill_level = _RunMagicQuotes($_POST[skill_level]);
	$speciality = _RunMagicQuotes($_POST[speciality]);

	//使用token验证可有效的防止非法来源数据提交访问，增加数据操作的安全性
	$module = _RunMagicQuotes($_POST['module']);
	$timestamp = _RunMagicQuotes($_POST['timestamp']);
	$token = _RunMagicQuotes(md5($module.'#$@%!^*'.$timestamp));
	if($token != $_POST['token']){
	 echo('非法数据来源');
	 exit();
	}

	$created_at = time();
	$sql="insert into `eml_address_list` (`id` ,`name` ,`sex` ,`phone` ,`nation` ,`duty` ,`idnumber` ,`birthday` ,`address`, `edu`, `title`, `title_date`, `skill_level`, `speciality` ,`created_at` )
	values ('$id','$name','$sex','$phone','$nation','$duty','$idnumber','$birthday','$address', '$edu', '$title','$title_date', '$skill_level', '$speciality', '$created_at');";

	if($db->query($sql)){echo success($msg,"?action=address");}else{echo error($msg);}
	exit;
}


//编辑	
if($do=="edit"){
	If_rabc($action,$do); //检测权限
	is_admin($action,$do); //检测权限
	$smt = new smarty();smarty_cfg($smt);
	//查询
	$sql=" select * from eml_address_list where id='{$id}' limit 1";
	
	$db->query($sql);
	$row=$db->fetchRow();
	
	//模版
	$smt->assign('row',$row);
	$smt->assign('title',"编辑");
	$smt->display('address_edit.htm');
	exit;
}

//更新
if($do=="updata"){
	If_rabc($action,$do); //检测权限	
	is_admin($action,$do); //检测权限
	$id = _RunMagicQuotes($_POST[id]);
	$name = _RunMagicQuotes($_POST[name]);
	$sex = _RunMagicQuotes($_POST[sex]);
	$tel = _RunMagicQuotes($_POST[tel]);
	$phone = _RunMagicQuotes($_POST[phone]);
	$email = _RunMagicQuotes($_POST[email]);
	$qq = _RunMagicQuotes($_POST[qq]);
	$deparyment = _RunMagicQuotes($_POST[deparyment]);
	$position = _RunMagicQuotes($_POST[position]);
	$address = _RunMagicQuotes($_POST[address]);
	
    if(!$id){echo error($msg);exit;}
	$updated_at= time();
	$sql="update eml_address_list SET 
	`name` = '$name',
	`sex` = '$sex',
	`deparyment` = '$deparyment',
	`position` = '$position',
	`phone` = '$phone',
	`tel` = '$tel',
	`email` = '$email',
	`address` = '$address',
	`updated_at` = '$updated_at' where `id` ='$id' limit 1 ;";
	
	if($db->query($sql)){echo success($msg,"?action=address");}else{echo error($msg);}	
	exit;
}

//删除
if($do=="del"){
	If_rabc($action,$do); //检测权限
	is_admin($action,$do); //检测权限
	$sql="delete from `eml_address_list` where `id`=$id limit 1";
	if($db->query($sql)){echo success($msg,"?action=address");}else{echo error($msg);}		
	exit;
}


//批量删除
if($do=="del_all"){
	If_rabc($action,$do); //检测权限
	is_admin($action,$do); //检测权限
	$arr = _RunMagicQuotes($_POST[item]);
	$count_arr=count($arr); 
	if($count_arr==0){
	echo error($msg); 
	exit;
	}
	$str = implode("','",$arr);//拼接字符
	
	$sql = "delete from eml_address_list WHERE id in('{$str}')";
	
	if($db->query($sql)){echo success($msg,"?action=address");}else{echo error($msg);}		
	exit;
	 
 }

?>
