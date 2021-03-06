<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
 <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${title}</title>
	
    <link rel="stylesheet" type="text/css" href="${basePath}static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${basePath}static/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${basePath}static/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="${basePath}static/easyui/demo/demo.css">
	<script type="text/javascript" src="${basePath}static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}static/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${basePath}static/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${basePath}static/js/common.js"></script> 
	<script type="text/javascript" src="${basePath}static/easyui/plugins/jquery.edatagrid.js"></script> 
	<style type="text/css">
		.div_add {
			width: 32%;
			text-align: left;
			display: inline-block;
		}
		.detail_row {
			margin-top: 10px;
			width: 100%;
		}
		.detail_query {
			width: 100%;
		}
		.query_param {
			margin-left: 6px;
		}
		.query_form {
			margin:14px 0;
		}
	</style>
</head>
<body>
   <div class="detail_query">
   		<input type="hidden" id="id" name="id" value="${id}" />
   		<div style="width: 100%;">
   			<div class="div_add">
				<label>店名:</label> 
				${aroundStoreVo.name}
			</div>
			<div class="div_add">
				<label>所属小区:</label> 
				${aroundStoreVo.villageName}
			</div>
			<div class="div_add">
				<label>浏览/回复/违规:</label> 
				${aroundStoreVo.viewReplyIllegalNumber}
			</div>
		</div>
		<div class="detail_row">
			<div class="div_add">
				<label>点赞/倒赞:</label> 
				${aroundStoreVo.likesOrhate}
			</div>
			<div class="div_add" style="width:60%">
				<label>5星/4星/3星/2星/1星:</label> 
				${aroundStoreVo.startNumber}
			</div>
		</div>
		<form id="ff" method="post">
			<div class="query_form">
				<input type="hidden" id="insId" name="insId" value="${insId}" />
				<label for="insName">回复人:</label> 
				<input class="easyui-textbox" type="text" name="insName" id="insName" style="width: 70px;">
				<label for="content" class="query_param">回复内容:</label> 
				<input class="easyui-textbox" type="text" name="content" id="content" style="width: 120px;">
				<label for="illegalStatus" class="query_param">违规状态:</label> 
				<select id="illegalStatus" editable="false" name="illegalStatus" class="easyui-combobox" style="width: 80px;">
					<option value="">全部</option>
					<option value="0">${ZC}</option>
					<option value="1">${WG}</option>
				</select>
				<input type="button" class="query_param" onclick="searchComment()" value="查询" />
			</div>
		</form>
	</div>
    <table id="dg" class="easyui-datagrid"
    		url="aroundStore/findCommentAll?aroundStoreId=${id}"
            toolbar="#toolbar" pagination="true" queryParams="form2Json('ff')"
            fitColumns="true" singleSelect="true" rownumbers="true"
            data-options="onClickRow: onClickRow,fit:false,border:false,pageSize:20,pageList:[20,50,100,200]" >
        <thead>
            <tr>
            	<th field="insName" width="50" >回复人</th>
                <th field="content" width="50">回复内容</th>
                <th field="opreaterIp" width="50">回复人IP</th>
                <th field="insYmdhms" width="50" formatter = "conversion">回复时间</th>
                <th field="viewReplyIllegalNumber" width="50">浏览/回复/违规</th>
                <th field="likesOrhate" width="50">点赞/倒赞</th>
                <th field="illegalStatus" width="50" formatter = "formatStatus">违规状态</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteComment()">删除</a>
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-tocomment" plain="true" onclick="toCommentReply()">回复管理</a>
    </div>
    
	<script type="text/javascript">
		function formatStatus(val,row){
			if (val == "0"){
				return '<span>正常</span>';
			} else {
				return "<span style='color:red'>违规</span>";
			}
		}
		function conversion(value){
       		var time = new Date(value);
       		return time.format("yyyy-MM-dd hh:mm:ss");
   		}
		
	   var url;
	   function searchComment(){
		   $('#ff').form('submit',{  
			    url: "aroundStore/findCommentAll?aroundStoreId=${id}",  
			    onSubmit: function(){  
			    	return $(this).form('validate'); 
			    },  
			    success:function(data){  
			    	var data = eval('('+data+')');
			       $('#dg').datagrid('loadData',data);
			    }
			});  
	   }
        function deleteComment() {
        	var rows = $('#dg').datagrid('getSelections');
        	if(rows.length>1){
        		$.messager.show({    // show error message
                    title: 'Warning',
                    msg: '请选择一条数据删除!'
                });
        		return;
        	}
            var row = rows[0];
            if (row){
                $.messager.confirm('提示','确定要删除吗?',function(r){
                    if (r){
                        $.post('aroundStore/deleteComment',{id:row.id,delFlag:'1'},function(result){
                            if (result.type=='Success'){
                            	$.messager.show({    // show error message
                                    title: 'Success',
                                    msg: result.Msg
                                });
                            	parent.$('#addAroundStoreFormUI').attr("src","aroundStore/toCommentAroundStore/${id}");
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.Msg
                                });
                            }
                        },'json');
                    }
                });
            }else{
            	$.messager.alert('提示信息','请先选择要删除的记录。','info');
            }
        }
        function toCommentReply() {
        	var row = $('#dg').datagrid('getSelected');
            if (row){
            	parent.$('#addAroundStoreFormUI').attr("src","aroundStore/toReplyComment/"+row.id+"/${id}");
            	parent.$('#dlg').dialog('open').dialog('setTitle','周边店回复的回复管理');
            }else{
            	$.messager.alert('提示信息','请先选择要进行回复管理的记录。','info');
            }
        }
    </script>
    <script type="text/javascript">
    /* 行编辑时所用的方法 */
    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#dg').datagrid('validateRow', editIndex)){
            $('#dg').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function onClickRow(index){
        if (editIndex != index){
            if (endEditing()){
                $('#dg').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                editIndex = index;
            } else {
                $('#dg').datagrid('selectRow', editIndex);
            }
        }
        $('#toolbar').empty();
        var row = $('#dg').datagrid('getSelected');
        if (row){
	        if (row.illegalStatus == '0') {
	        	$('#toolbar').append("<a href='javascript:void(0)' class='easyui-linkbutton' data-options=\"iconCls:'icon-remove',plain:true\" onclick='deleteComment()'>删除</a>");
	        	$('#toolbar').append("<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-tocomment' plain='true' onclick='toCommentReply()'>回复管理</a>");
	        	$.parser.parse($('#toolbar'));
	        } else {
	        	$('#toolbar').append("<a href='javascript:void(0)' class='easyui-linkbutton' data-options=\"iconCls:'icon-remove',plain:true\" onclick='deleteComment()'>删除</a>");
	        	$.parser.parse($('#toolbar'));
	        }
        }
    }
    function append(){
        if (endEditing()){
            $('#dg').datagrid('appendRow',{status:'P'});
            editIndex = $('#dg').datagrid('getRows').length-1;
            $('#dg').datagrid('selectRow', editIndex)
                    .datagrid('beginEdit', editIndex);
        }
    }
    function removeit(){
        if (editIndex == undefined){return}
        $('#dg').datagrid('cancelEdit', editIndex)
                .datagrid('deleteRow', editIndex);
        editIndex = undefined;
    }
    /**绑定页面回车事件，以及初始化页面时的光标定位**/  
    $(function(){  
        bindFormComm("ff",searchComment);
        }); 
     
    </script>
</body>
</html>