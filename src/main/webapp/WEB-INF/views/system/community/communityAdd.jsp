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
	<script type="text/javascript" src="${basePath}static/js/validator.js"></script>
</head>
<body>
	<div class="ftitle"></div>
    <form id="fm" method="post" novalidate>
        <div class="div_fitem_1">
            <label for="communityCode" class="lable_add">社区编码:</label>
            <input id="communityCode" name="communityCode" class="easyui-textbox" data-options="required:true,validType:'isBlank',validType:'engAndNum'">
        </div>
         <div class="div_fitem_1">
            <label for="communityName" class="lable_add">社区名称:</label>
            <input id="communityName" name="communityName" class="easyui-textbox" data-options="required:true,validType:'isBlank',validType:'hanzi'">
        </div>
        <div class="div_fitem_1">
            <label class="lable_add">所属省:</label>
            <input id="provinceId" name="provinceId" value="" class="easyui-combobox" data-options="required:true">
        </div>
        <div class="div_fitem_1">
            <label class="lable_add" for="cityId">所属市:</label>
            <input id="cityId" name="cityId" value="" class="easyui-combobox" data-options="required:true">
        </div>
        <div class="div_fitem_1">
            <label  class="lable_add" for="countyId">所属区:</label>
            <input id="countyId" name="countyId" value="" class="easyui-combobox" data-options="required:true">
        </div>
        <div class="div_fitem_1">
            <label class="lable_add">排序:</label>
            <input id="ordering" name="ordering" value="" class="easyui-numberbox" data-options="validType:'integer'">
        </div>
    </form>
</body>
<script type="text/javascript">
function optSubmit(){
	var provinceId = $('#provinceId').combobox('getValue');
	if(provinceId=='0'||provinceId==""){
		var res = "请选择所属省";
		$.messager.show({
         title: 'Error',
         msg: res
     });
		return false;
	}
	var cityId = $('#cityId').combobox('getValue');
	if(cityId=='0'||cityId==""){
		var res = "请选择所属市";
		$.messager.show({
         title: 'Error',
         msg: res
     });
		return false;
	}
	var countyId = $('#countyId').combobox('getValue');
	if(countyId=='0'||countyId==""){
		var res = "请选择所属区";
		$.messager.show({
         title: 'Error',
         msg: res
     });
		return false;
	}
    $('#fm').form('submit',{
        url: "community/saveCommunity",
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
            var result = eval('('+result+')');
            if ("Error"==result.type){
                $.messager.show({
                    title: 'Error',
                    msg: result.Msg
                });
                
            } else {
            	$.messager.show({
                    title: 'Success',
                    msg: result.Msg,
                    timeout:1000,
                	showType:'slide'
                });
            	setTimeout('window.parent.close()',2000);
            }
        }
    });
}
$(function(){
	// 省份 下拉框选择控件，下拉框的内容是动态查询数据库信息 
 	$('#provinceId').combobox({ 
	    url:'common/initProvinceQY',
	    editable:false, //不可编辑状态
	    cache: false,
	    panelHeight: '180',//自动高度适合
	    valueField:'provinceId',   
	    textField:'provinceName',
		onHidePanel: function(){
		    $("#cityId").combobox("setValue",'');
		    $("#countyId").combobox("setValue",'');
            $("#countyId").combobox('loadData', {});
		    //$("#cregicounty").val('');
			var province = $('#provinceId').combobox('getValue');		
			if(province!=''){
				$.ajax({
					type: "POST",
					url: "common/getCityByProviceQY/"+province,
					cache: false,
					dataType : "json",
					success: function(data){
						$("#cityId").combobox("loadData",data);
			        }
	        	}); 	
            }
        } 
    }); 
	//市下拉菜单
	$('#cityId').combobox({ 
	    editable:false, //不可编辑状态
	    cache: false,
	    panelHeight: '180',//自动高度适合
	    valueField:'cityId',   
	    textField:'cityName',
	    onHidePanel: function(){
		    $("#countyId").combobox("setValue",'');
			var city = $('#cityId').combobox('getValue');		
			if(city!=''){
				$.ajax({
					type: "POST",
					url: "common/getCountryByCityQY/"+city,
					cache: false,
					dataType : "json",
					success: function(data){
						$("#countyId").combobox("loadData",data);
			        }
		        }); 	
            }
        }
	});
	//区下拉菜单
	$('#countyId').combobox({ 
	    editable:false, //不可编辑状态
	    cache: false,
	    panelHeight: '180',//自动高度适合
	    valueField:'countyId',   
	    textField:'countyName',
	});  
})
</script>
</html>