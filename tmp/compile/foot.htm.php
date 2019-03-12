
  </div>

  <hr>

  <footer>
<p>&nbsp;&nbsp; Powered by <a href="http://bbs.emlsoft.com/" target="_blank">emlSoft</a> <?php echo $this->_var['cfg']['version']; ?> 2013-2018 Some rights reserved</p>
  </footer>

</div>



<script src="./js/jquery.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap-datepicker.js"></script>

<script>
$(function(){
	window.prettyPrint && prettyPrint();
	$('#datepicker').datepicker({
		format: 'yyyy-mm-dd'
	});
	$('#datepicker2').datepicker({
		format: 'yyyy-mm-dd'
	});
});
</script>
</body>
</html>