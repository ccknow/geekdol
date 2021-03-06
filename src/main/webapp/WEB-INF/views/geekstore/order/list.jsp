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
				<label for="userName">商品编号:</label> 
				<input class="easyui-textbox" type="text" name="goodsCode" />
			</div>
			 <div style="float: left; padding: 20px 0 0 20px;">
				<label for="userid">买方:</label> 
				<input class="easyui-textbox" type="text" name="buyerName"  /> 
			</div>
			<div style="float: left; padding: 20px 0 0 20px;">
				<label for="userid">卖方:</label> 
				<input class="easyui-textbox" type="text" name="sellerName"  /> 
			</div>
			<div style="float: left; padding: 20px 0 0 20px;">
            <label for="status">销售模块:</label>
                <input id="sellModel" name="sellModel"  class="easyui-combobox" 
					data-options="valueField:'id',textField:'name',editable:false,url:'order/sellerModel'">
        </div>
            <div style="float: left; padding: 20px 0 0 20px;">
            <label for="status">状态:</label>
                <input id="status" name="status" class="easyui-combobox" 
					data-options="valueField:'value',textField:'lable',editable:false,url:'common/initSysData/${ORDERSTATUS}'">
        </div>
			<div style="float: left; padding: 20px 0 0 20px;">
				<input  type="button" onclick="searchApp()" value="查询" />
			</div>
		</form>
	<input name="WFH" id="WFH" type="hidden" value="${WFH}">
	<input name="WFK" id="WFK" type="hidden" value="${WFK}">
	<input name="DCLTH" id="DCLTH" type="hidden" value="${DCLTH}">
	<input name="DTK" id="DTK" type="hidden" value="${DTK}">

	</div> 
     <table id="dg"  class="easyui-datagrid" style="height: 620px;"
            url="order/findAll" 
            toolbar="#toolbar" pagination="true" queryParams="form2Json('ff')" fitColumns="true" singleSelect="true" 
            data-options="fit:false,onClickRow: onClickRow,border:false,pageSize:20,pageList:[20,50,100,200]" >
        <thead>
            <tr>
            	<th field="ck" checkbox="false"></th>
            	<th field="orderCode" width="10%" >订单编号</th>
                <th field="buyerName" width="9%">买方</th>
                <th field="sellerName" width="9%" formatter="good">卖方</th>
                <th field="payMode" width="9%">支付方式</th>
                <th field="classificName" width="9%" formatter="good">销售模块</th>
                <th field="goodsCode" width="10%" formatter="good">商品编码</th>
                <th field="costPrice" width="9%" formatter="good">成本价</th>
                <th field="sellPrice" width="9%" formatter="good">销售价</th>
                <th field="orderTime" width="18%" formatter="conversion">下单时间</th>
                <th field="orderStatus" width="9%">状态</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
    	<shiro:hasPermission name="Order:view">
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="details()">详情</a> 
        </shiro:hasPermission>
        <shiro:hasPermission name="Order:manager">       
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="delivery()">发货</a>        	
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="returnGood()">处理退货</a>
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="refund()">退款</a>
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="closeOrder()">关闭</a>
        	
        </shiro:hasPermission>
    </div>
    <div id="toolbar">
        
    </div>
    
    	<div id="dlg" class="easyui-dialog" style="padding:10px 20px;width: 800px; height: 550px"
            closed="true" buttons="#dlg-buttons">
		  	<iframe id='addUserFormUI' border='0' vspace='0' hspace='0' 
		    	marginwidth='0' marginheight='0' framespacing='0' frameborder='0' scrolling='yes' 
		    	style="height:90%;width:100%;left:10px;top:8px" src="">
		    </iframe>
	    </div>
	     <div id="dlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	    </div>
   <script type="text/javascript">
	   function good(value){
		   var data = value.split(",");
		   var str = "";
		   for(var i=0; i<data.length; i++){
			   str +=data[i]+ "<br/>";
	       }
		   return str;
	   };
   		function conversion(value){
       		var time = new Date(value);
       		return time.format("yyyy-MM-dd hh:mm:ss");
   		};
	</script>
    <script type="text/javascript">
	   var url;
	   
	   function searchApp(){
		 /*   $('#ff').form('submit',{  
			    url: "order/findAll",
			    onSubmit: function(){  
			    	return $(this).form('validate'); 
			    },  
			    success:function(data){  
			    	var data = eval('('+data+')');
			       $('#dg').datagrid('loadData',data);
			    }
			}); */  
		   $('#dg').datagrid({ queryParams: form2Json("ff") });
	   }
        function details(){
        	  var row = $('#dg').datagrid('getSelected');
              if (row){
            	  console.log(row.goodsCode);
              	$('#addUserFormUI').attr("src","order/details/"+row.orderId+"/"+row.goodsCode);
                  $('#dlg').dialog('open').dialog('setTitle','详情');
              }else{
              	$.messager.alert('提示信息','请先选择要查看的记录。','info');
              }
        }
        /* 编辑时，进行页面跳转的时候传入所选的row的id，然后把值传入到子画面，子画面根据该值来加载数据 */
        function delivery(){
        	
            var row = $('#dg').datagrid('getSelected');
            var WFH = $('#WFH').val();
            if (row){
            	if(row.status==WFH){
            		$('#addUserFormUI').attr("src","order/delivery/"+row.orderId+"/"+row.goodsCode);
                    $('#dlg').dialog('open').dialog('setTitle','发货');
            	} else{
            		$.messager.alert('提示信息','改订单不能发货','info');
            	}
            	
            }else{
            	$.messager.alert('提示信息','请先选择要发货的订单。','info');
            }
        }
        
function closeOrder(){
			var WFK = $('#WFK').val();
            var row = $('#dg').datagrid('getSelected');
            if (row){
            	if(row.status==WFK){
            		$('#addUserFormUI').attr("src","order/close/"+row.orderId+"/"+row.goodsCode);
                    $('#dlg').dialog('open').dialog('setTitle','关闭');
            	}else{
            		$.messager.alert('提示信息','改订单不能关闭','info');
            	}
            	
            }else{
            	$.messager.alert('提示信息','请先选择要关闭的订单。','info');
            }
        }
function returnGood(){
	var DCLTH = $('#DCLTH').val();
    var row = $('#dg').datagrid('getSelected');
    if (row){
    	if(row.status==DCLTH){
    		$('#addUserFormUI').attr("src","order/returnGood/"+row.orderId+"/"+row.goodsCode);
            $('#dlg').dialog('open').dialog('setTitle','退货');
    	}else{
    		$.messager.alert('提示信息','改订单不能退货','info');
    	}    	
    }else{
    	$.messager.alert('提示信息','请先选择要退货的订单。','info');
    }
}

function refund(){
	var DTK = $('#DTK').val();
    var row = $('#dg').datagrid('getSelected');
    if (row){
    	if(row.status==DTK){
    		$('#addUserFormUI').attr("src","order/refund/"+row.orderId+"/"+row.goodsCode);
            $('#dlg').dialog('open').dialog('setTitle','退款');
    	} else{
    		$.messager.alert('提示信息','改订单不能退款','info');
    	}   	
    }else{
    	$.messager.alert('提示信息','请先选择要退款的订单。','info');
    }
}
        
        function saveUser(){
            /* 调用共通js中是否为IE的判定方法 */
    		if(isIE()) {
    			window.frames["addUserFormUI"].optSubmit();
    		} else {
    			window.frames["addUserFormUI"].contentWindow.optSubmit();
    		}
        }        
       /*弹出diago 子画面调用父画面的方法 */
        function close(){
        	$('#dlg').dialog('close');
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
    
      function formatVillage(value){
    	        return value.villageName;
    	    };
    	    
    
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
    </script>
</body>
</html>