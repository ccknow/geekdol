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
</head>
<body>

   <div style="height: 70px; width: 100%;">
		<form id="ff" method="post">
			
			<div style="float: left; padding: 20px 0 0 20px;">
				<label for="status">省:</label> 
                <input id="province" name="provinceId" class="easyui-combobox" style="width: 100px;">
			
                <label for="status">市:</label> 
                <input id="city" name="cityId" class="easyui-combobox" style="width: 100px;">
           
                <label for="status">区县:</label> 
                <input id="county" name="countyId" class="easyui-combobox" style="width: 100px;">
			
			
                <label for="status">社区:</label> 
                <input id="community" name="communityId" class="easyui-combobox" style="width: 100px;">
            </div>
            
            <%-- <div style="float: left; padding: 20px 0 0 20px;" >
                <label for="isKaidian">是否开店:</label> 
                <select id="kaidian" name="kaidian" class="easyui-combobox" style="width: 60px;" editable="false">
                    <option value="">全部</option>
                    <option value="0">${WK}</option>
                    <option value="1">${YK}</option>
                </select>
            </div> --%>
            
            <div style="float: left; padding: 20px 0 0 20px;">
                <label for="villageName">小区名:</label> 
                <input class="easyui-textbox" type="text" name="villageName" style="width: 60px;" />
            </div>
            <div style="float: left; padding: 20px 0 0 20px;">
                <label for="villageAddress">地址:</label> 
                <input class="easyui-textbox" type="text" name="villageAddress"  style="width: 60px;"/>
            </div>
            <div style="float: left; padding: 20px 0 0 20px;" >
                <label for="status">使用状态:</label> 
                <select id="status" name="status" class="easyui-combobox" style="width: 60px;" editable="false">
                    <option value="">全部</option>
                    <option value="0">${QY}</option>
                    <option value="1">${JY}</option>
                </select>
            </div>
			<div style="float: left; padding: 20px 0 0 20px;">
				<input  type="button" onclick="searchProvince()" value="查询" />
			</div>
		</form>


	</div> 
    <table id="dg"  class="easyui-datagrid" style="height:620px;"
            url="village/findAll" 
            toolbar="#toolbar" pagination="true" queryParams="form2Json('ff')"
            fitColumns="true" singleSelect="true" 
            data-options="fit:false,onClickRow: onClickRow,border:false,pageSize:20,pageList:[20,50,100,200]" >
        <thead>
            <tr>
                <!-- <th field="ordering" width="20">排序</th> -->
            	<th field="villageName" width="50" >小区名称</th>
                <th field="villageAddress" width="50">小区地址</th>
                <th field="villageLongitude" width="50" >中心点经度</th>
                <th field="villageLatitude" width="50">中心点维度</th>
                <th field="provinceName" width="20">所属省</th>
                <th field="cityName" width="20">所属市</th>
                <th field="countyName" width="20">所属区</th>
                <th field="communityName" width="50">所属社区</th>
                <!-- <th field="kaidian" width="50" formatter = "formatIskaidian">是否开店</th> -->
                <th field="status" width="50" formatter = "formatStatus">使用状态</th>
            </tr>
        </thead>
    </table>
    <shiro:hasPermission name="Village:manager">
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-qiyong',plain:true" onclick="accept()">启用</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reject',plain:true" onclick="reject()">禁用</a>
    </div>
    </shiro:hasPermission>
    
   	<div id="dlg" class="easyui-dialog" style="padding:10px 20px;width:600px;height:500px;draggable:true;resizable:true;overflow: hidden;"
           closed="true" buttons="#dlg-buttons" modal="true">
	  	<iframe id='addUserFormUI' border='0' vspace='0' hspace='0' 
	    	marginwidth='0' marginheight='0' framespacing='0' frameborder='0' scrolling='yes' 
	    	style="height:100%;width:100%;left:10px;top:8px" src="">
	    </iframe>
    </div>
     <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">关闭</a>
    </div>
	    
	<script type="text/javascript">
	
	   function formatIskaidian(val,row){
           if (val == "0"){
               return '<span>否</span>';
           } else {
               return '<span>是</span>';
           }
       }
	
		function formatStatus(val,row){
			if (val == "0"){
				return '<span>启用</span>';
			} else {
				return '<span>禁用</span>';
			}
		}
		
		
		  // 禁用启用
	    function rejectOrAccept(){
	        var row = $('#dg').datagrid('getSelected');
	        
	            if (row){
	                if(row.status == '1'){// 启用
	                $.messager.confirm('提示','确定要启用吗?',function(r){
	                    if (r){
	                        $.post('village/rejectOrAcceptVillage',{villageId:row.villageId,status:'0'},function(result){
	                            if (result.type=='Success'){
	                                $.messager.show({    // show error message
	                                    title: 'Success',
	                                    msg: result.Msg
	                                });
	                                $('#dg').datagrid('reload');    // reload the user data
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
	                 $.messager.confirm('提示','确定要禁用吗?',function(r){
	                        if (r){
	                            $.post('village/rejectOrAcceptVillage',{villageId:row.villageId,status:'1'},function(result){
	                                if (result.type=='Success'){
	                                    $.messager.show({    // show error message
	                                        title: 'Success',
	                                        msg: result.Msg
	                                    });
	                                    $('#dg').datagrid('reload');    // reload the user data
	                                } else {
	                                    $.messager.show({    // show error message
	                                        title: 'Error',
	                                        msg: result.Msg
	                                    });
	                                }
	                            },'json');
	                        }
	                    });
	            }
	            }else{
	                $.messager.alert('提示信息','请先选择要启用的记录。','info');
	            }
	    }
		
		
	</script>
   
    <script type="text/javascript">
	   var url;
	   
	   function searchProvince(){
		  /*  $('#ff').form('submit',{  
			    url: "village/findAll",  
			    onSubmit: function(){  
			    	return $(this).form('validate'); 
			    },  
			    success:function(data){  
			    	var data = eval('('+data+')');
			       $('#dg').datagrid('loadData',data);
			    }
			});   */
		   $('#dg').datagrid({ queryParams: form2Json("ff") }); 
	   }
	   
        function newUser(){
        	$('#addUserFormUI').attr("src","village/toAddVillage");
            $('#dlg').dialog('open').dialog('setTitle','新增');
            $('#organId').combobox({
               	onLoadSuccess: function () { 
               		 var data = $('#organId').combobox('getData');
        		             if (data.length > 0) {
        		                 $('#organId').combobox('select', data[0].organId);
        		             } 
               		}
               });
            $('#roleId').combobox({
               	onLoadSuccess: function () { 
               		 var data = $('#roleId').combobox('getData');
        		             if (data.length > 0) {
        		                 $('#roleId').combobox('select', data[0].roleId);
        		             } 
               		}
               });
            $('#fm').form('clear');
            url = 'village/toAddVillage';
        }
        /* 编辑时，进行页面跳转的时候传入所选的row的id，然后把值传入到子画面，子画面根据该值来加载数据 */
        function editUser(){
        	
            var row = $('#dg').datagrid('getSelected');
            if (row){
            	$('#addUserFormUI').attr("src","village/toEditVillage/"+row.villageId+"/"+row.provinceId+"/"+row.cityId+"/"+row.countyId+"/"+row.communityId);
                $('#dlg').dialog('open').dialog('setTitle','编辑');
            }else{
            	$.messager.alert('提示信息','请先选择要更新的记录。','info');
            }
        }
        function saveUser(){
            /* 调用共通js中是否为IE的判定方法 */
   		   if(window.frames["addUserFormUI"].contentWindow==undefined){
   	            window.frames["addUserFormUI"].optSubmit();
   	       }else{
   	            window.frames["addUserFormUI"].contentWindow.optSubmit();
   	       }
        }
        function destroyUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('提示','确定要删除吗?',function(r){
                    if (r){
                        $.post('village/updateVillage',{villageId:row.villageId,delFlag:'1'},function(result){
                            if (result.type=="Success"){
                            	 $.messager.show({    // show error message
                                     title: 'Success',
                                     msg: result.msg
                                 });
                                $('#dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.msg
                                });
                            }
                        },'json');
                    }
                });
            }else{
                $.messager.alert('提示信息','请先选择要删除的记录。','info');
            }
        }
       /*弹出diago 子画面调用父画面的方法 */
        function close(){
        	$('#dlg').dialog('close');
        	$('#editordlg').dialog('close');
        	$('#dg').datagrid('reload');
        }
    </script>
    <style type="text/css">
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
        .fitem input{
            width:160px;
        }
    </style>
    <script type="text/javascript">
    /* 行编辑时所用的方法 */
    var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true}
		if ($('#dg').datagrid('validateRow', editIndex)){
			/* var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
			var productname = $(ed.target).combobox('getText');
			$('#dg').datagrid('getRows')[editIndex]['productname'] = productname; */
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
	// 启用
	function accept(){
		var row = $('#dg').datagrid('getSelected');
        if (row){
        	if(row.status==1){
            $.messager.confirm('提示','确定要启用吗?',function(r){
                if (r){
                    $.post('village/rejectOrAcceptVillage',{villageId:row.villageId,status:'0'},function(result){
                        if (result.type=='Success'){
                        	$.messager.show({    // show error message
                                title: 'Success',
                                msg: result.Msg
                            });
                            $('#dg').datagrid('reload');    // reload the user data
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
        		$.messager.alert('提示信息','这条数据已经被启用','info');
        	}
        }else{
            $.messager.alert('提示信息','请先选择要启用的记录。','info');
        }
	}
	// 禁用
	function reject(){
		var row = $('#dg').datagrid('getSelected');
        if (row){
        	if(row.status==0){
        		$.messager.confirm('提示','确定要禁用吗?',function(r){
                    if (r){
                        $.post('village/rejectOrAcceptVillage',{villageId:row.villageId,status:'1'},function(result){
                            if (result.type=='Success'){
                            	   $.messager.show({    // show error message
                                       title: 'Success',
                                       msg: result.Msg
                                   });
                                   $('#dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.Msg
                                });
                            }
                        },'json');
                    }
                });
        	} else{
        		$.messager.alert('提示信息','这条数据已经被禁用','info');
        	}                        
        }else{
            $.messager.alert('提示信息','请先选择要禁用的记录。','info');
        }
	}
	function getChanges(){
		var rows = $('#dg').datagrid('getChanges');
		alert(rows.length+' rows are changed!');
	}
    
    </script>
    
    
        
    <!-- 省市区关联 -->
    <script type="text/javascript">
    $(function(){
        
        // 省份 下拉框选择控件，下拉框的内容是动态查询数据库信息 
        $('#province').combobox({ 
                    url:'common/initProvince',
                    editable:false, //不可编辑状态
                    cache: false,
                    panelHeight: '200px',//自动高度适合
                    valueField:'provinceId',   
                    textField:'provinceName',
                    
        onHidePanel: function(){

                $("#city").combobox("setValue",'');
                $("#county").combobox("setValue",'');
                $("#county").combobox('loadData', {});
                $("#community").combobox("setValue",'');
                $("#community").combobox('loadData', {});
                var province = $('#province').combobox('getValue');     
                if(province!=''){
                $.ajax({
                    type: "POST",
                    url: "common/getCityByProvice/"+province,
                    cache: false,
                    dataType : "json",
                    success: function(data){
                    $("#city").combobox("loadData",data);
                                           }
                                       });  
                               }
                         } 
                     }); 
        //市下拉菜单
        $('#city').combobox({ 

            editable:false, //不可编辑状态
            cache: false,
            panelHeight: '200px',//自动高度适合
            valueField:'cityId',   
            textField:'cityName',
            onHidePanel: function(){
                $("#county").combobox("setValue",'');
                $("#community").combobox("setValue",'');
                $("#community").combobox('loadData', {});
                var city = $('#city').combobox('getValue');     
                if(city!=''){
                $.ajax({
                    type: "POST",
                    url: "common/getCountryByCity/"+city,
                    cache: false,
                    dataType : "json",
                    success: function(data){
                    $("#county").combobox("loadData",data);
                                           }
                                       });  
                               }
                         }
           }); 
        //区下拉菜单
        $('#county').combobox({ 
            editable:false, //不可编辑状态
            cache: false,
            panelHeight: '200px',//自动高度适合
            valueField:'countyId',   
            textField:'countyName',
            onHidePanel: function(){
                $("#community").combobox("setValue",'');
                var county = $('#county').combobox('getValue');     
                if(county!=''){
                $.ajax({
                    type: "POST",
                    url: "common/getCommunityByCounty/"+county,
                    cache: false,
                    dataType : "json",
                    success: function(data){
                    $("#community").combobox("loadData",data);
                                           }
                                       });  
                               }
                         }
         });  
      //社区下拉菜单
        $('#community').combobox({ 

            editable:false, //不可编辑状态
            cache: false,
            panelHeight: '200px',//自动高度适合
            valueField:'communityId',   
            textField:'communityName',
           });  
      
    });
    /**绑定页面回车事件，以及初始化页面时的光标定位**/  
    $(function(){  
    bindFormComm("ff",searchProvince);  
    });
    
    </script>
    
</body>
</html>