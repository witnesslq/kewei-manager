<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="/kewei-manager/js/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/kewei-manager/css/font-awesome.min.css">
	<link rel="stylesheet" href="/kewei-manager/css/main.css">
	<link rel="stylesheet" href="/kewei-manager/css/pagination.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	.tree-closed {
	    height : 40px;
	}
	.tree-expanded {
	    height : auto;
	    
	}
	body {
font: normal 150% Helvetica, Arial, sans-serif;
}
	</style>
	<!-- <style>
	body{text-align:center}
	.div{margin:0 auto;width:400px;height:100px;border:1px solid #F00 }
	</style> -->
  </head>

  <body>
<%@include file="/WEB-INF/common/userinfo.jsp"%>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-3 sidebar">
        <ul style="height:auto;width:auto;" class="list-group">
        <%@include file="/WEB-INF/common/common.jsp"%>
				</ul>
        </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-9 col-md-offset-3 main" >
          <h1 class="page-header">数据模板下载</h1>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-2 placeholder">
              <a href="/kewei-manager/DownloadExcel/文章.xlsx.do" class="glyphicon glyphicon-file" style="font-size:50px;"></a>
              <br>
              <h4>文章</h4>
            </div>
            <div class="col-xs-6 col-sm-2 placeholder">
              <a href="/kewei-manager/DownloadExcel/技术点.xlsx.do" class="glyphicon glyphicon-file" style="font-size:50px;"></a>
              <br>
              <h4>技术点</h4>
            </div>
            <div class="col-xs-6 col-sm-2 placeholder">
            <a href="/kewei-manager/DownloadExcel/技术点_文章.xlsx.do" class="glyphicon glyphicon-file" style="font-size:50px;"></a>
             <br>
              <h4>技术点_文章关系</h4>
            </div>
            <div class="col-xs-6 col-sm-2 placeholder">
            <a href="/kewei-manager/DownloadExcel/公司.xlsx.do" class="glyphicon glyphicon-file" style="font-size:50px;"></a>
             <br>
              <h4>技术点相关公司</h4>
            </div>
            <div class="col-xs-6 col-sm-2 placeholder">
            <a href="/kewei-manager/DownloadExcel/美国科技项目.xlsx.do" class="glyphicon glyphicon-file" style="font-size:50px;"></a>
             <br>
              <h4>美国科技项目</h4>
            </div>
        </div>
      </div>
    </div>
     <script src="/kewei-manager/js/jquery/jquery-3.0.0.js"></script>
    <script src="/kewei-manager/js/bootstrap/js/bootstrap.min.js"></script>
	<script src="/kewei-manager/script/docs.min.js"></script>
	<script src="/kewei-manager/js/layer/layer.js"></script>
	<script src="/kewei-manager/js/jquery/jquery.pagination.js"></script>
	<script src="/kewei-manager/js/jquery/jquery-form.min.js"></script>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
						$(this).toggleClass("tree-expanded");
						if ( $(this).hasClass("tree-expanded") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
					}
				});
			    
			    
            });
            $("#btnCancelUpload").click(function(){
		    	 document.getElementById("fileImport").reset(); 
		    });
            $("#btnUpload").click(function(){
            	var file = $("#file_upload");
            	if(file.val()==""){
            		layer.msg("文件不能为空", {time:1500, icon:5, shift:6}, function(){
            			file_upload.focus();
            		});
            	}
                var loadingIndex = -1;
    	    	$("#fileImport").ajaxSubmit({
    	    		beforeSubmit : function() {
    	    			loadingIndex = layer.load(2, {time: 1*1000});
    	    		},
    	    		success : function( r ) {
    	    			layer.close(loadingIndex);
    	    			if ( r.success) {
    	    				layer.msg("文件上传成功并导入数据库", {time:1500, icon:6, shift:6});
    	    				
    	    			} else {
    	    	    		layer.msg("文件上传失败，请检查后上传", {time:3000, icon:5, shift:6});
    	    			}
    	    		}
    	    	});
            });   
            
        </script>
  </body>
</html>
