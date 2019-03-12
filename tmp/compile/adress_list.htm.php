<?php echo $this->fetch('head.htm'); ?>
<?php echo $this->fetch('nav.htm'); ?>

<div class="span11">

		  <div class="row-fluid">
            <h3><?php echo $this->_var['title']; ?></h3>
          </div>

			<form class="form-search" action="" method="post">
			<?php if ($_SESSION['roleid'] == "1"): ?>	
			<a href="?action=address&do=new" class="btn btn-primary pull-right" ><i class="icon-pencil icon-white" ></i> 新建</a>
			<?php else: ?>
		     
		    <?php endif; ?>		
			
			<input type="text" name="kewords" class="input-small" value="<?php echo $_REQUEST['kewords']; ?>"  placeholder="姓名关键词">
			<?php echo $this->_var['select_userlist']; ?>	
			<input class="hidden-phone" type="text" name="time_start" value="<?php echo $_REQUEST['time_start']; ?>"  id="datepicker" placeholder="开始时间" class="input-small"/>
			- <input class="hidden-phone" type="text" name="time_over" value="<?php echo $_REQUEST['time_over']; ?>"  id="datepicker2" placeholder="结束时间" class="input-small"/>
			<button type="submit" class="btn"><i class="icon-search"></i> 查询</button>
            <a href="" class="btn hidden-phone"><i class="icon-th-list"></i> 全部</a>
			<button type="reset" class="btn"><i class="icon-repeat"></i> 重置</button>
			</form> 
		
		<form action="?action=address&do=del_all" method="post"  onload="changecolor()">
          <div class="row-fluid">
            <div class="span12">
	
			<table class="table table-bordered table-striped">
				<tr>
						<th>选项</th>
						<th>姓名</th>
                    <th class="hidden-phone">性别</th>
                    <th class="hidden-phone">手机</th>
                    <th class="hidden-phone">名族</th>
                    <th class="hidden-phone">职位</th>
                    <th class="hidden-phone">身份证号</th>
                    <th class="hidden-phone">出生月份</th>
                    <th class="hidden-phone">住址</th>
                    <th class="hidden-phone">文化程度</th>
                    <th class="hidden-phone">职称</th>
                    <th class="hidden-phone">职称评定时间</th>
                    <th class="hidden-phone">技能鉴定等级</th>
                    <th class="hidden-phone">特长</th>
                    <th class="hidden-phone">创建时间</th>
						<?php if ($_SESSION['roleid'] == "1"): ?>
						<th>操作</th>
						<?php else: ?>
						<th class="hidden-phone">操作</th>
					    <?php endif; ?>	
						</tr>	
    <tbody id="tbs">
    <?php $_from = $this->_var['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'row');if (count($_from)):
    foreach ($_from AS $this->_var['row']):
?>
				<tr>
					<td> <input type='checkbox' value='<?php echo $this->_var['row']['id']; ?>' name='item[]' class='ck' /></td>
					<td><?php echo $this->_var['row']['name']; ?></td>
					<td class="hidden-phone"><?php echo $this->_var['row']['sex']; ?></td>
                    <td>
                        <a href="tel:<?php echo $this->_var['row']['phone']; ?>"><?php echo $this->_var['row']['phone']; ?></a>
                    </td>
                    <td class="hidden-phone"><?php echo $this->_var['row']['nation']; ?></td>
                    <td class="hidden-phone"><?php echo $this->_var['row']['duty']; ?></td>
                    <td class="hidden-phone"><?php echo $this->_var['row']['idnumber']; ?></td>
                    <td class="hidden-phone"><?php echo $this->_var['row']['birthday']; ?></td>
                    <td class="hidden-phone"><?php echo empty($this->_var['row']['address']) ? '无' : $this->_var['row']['address']; ?></td>
                    <td class="hidden-phone"><?php if($this->_var['row']['edu']==0){echo "小学";}elseif ($this->_var['row']['edu']==1){echo "初中";}
                        elseif ($this->_var['row']['edu'] == 2){echo "高中";}elseif ($this->_var['row']['edu']==3){echo "大专";}
                        elseif ($this->_var['row']['edu']==4){echo "本科";}elseif ($this->_var['row']['edu']==5){echo "研究生";}elseif ($this->_var['row']['edu']==6){echo "博士";}; ?></td>
                    <td class="hidden-phone"><?php echo $this->_var['row']['title']; ?></td>
                    <td class="hidden-phone"><?php echo $this->_var['row']['title_date']; ?></td>
                    <td class="hidden-phone"><?php echo $this->_var['row']['skill_level']; ?></td>
                    <td class="hidden-phone"><?php echo $this->_var['row']['speciality']; ?></td>

					<td class="hidden-phone"><?php echo date("Y-m-d H:i:s",$this->_var['row']['created_at']); ?></td>

					
		<?php if ($_SESSION['roleid'] == "1"): ?>	
		<td>
		<a class="btn btn-small" href="?action=address&do=edit&id=<?php echo $this->_var['row']['id']; ?>">
			<i class="icon-edit"></i>编辑</a>	
		<a class="btn btn-small" href="?action=address&do=del&id=<?php echo $this->_var['row']['id']; ?>" onclick="if(!confirm( '确认要删除吗? ')){return false;}"><i class="icon-trash"></i>
		删除</a>
					</td><?php else: ?><td class="hidden-phone">无权限</td><?php endif; ?>		
				 </tr>			
			<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
    </tbody>
</table>
<?php if ($_SESSION['roleid'] == "1"): ?>
				    <input type="submit" value="批量删除"/>
					<?php endif; ?>	
				  </form>
				<div class="pagination pagination-centered">
					  <ul class="">
						<li><span class="btn">共<?php echo $this->_var['total']; ?>条</span></li>
						<?php echo $this->_var['page']; ?>
					 </ul>
				</div>
	  
            </div>
          </div>
		  
		  
        </div>

<?php echo $this->fetch('foot.htm'); ?>