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

   <div style="height: 100px; width: 90%;">
        <input type="hidden" id="id" name="id" value="${id}" />
        <div style="float: left; padding: 20px 0 0 20px;" >
            <label>所属小区:</label> 
            ${villageName}
            &nbsp;&nbsp;&nbsp;
            <label>浏览/评论/举报:</label> 
            <span id="hotnumber">${hotnumber}</span>
            &nbsp;&nbsp;&nbsp;
            <label>点赞:</label> 
            ${likes}
        </div>
        <form id="ff" method="post">
            <div style="float: left; padding: 20px 0 0 20px;" >
                <input type="hidden" id="insId" name="insId" value="${insId}" />
                <label for="insName">评论人昵称:</label> 
                <input class="easyui-textbox" type="text" name="insName" id="insName">
                <label for="content">评论内容:</label> 
                <input class="easyui-textbox" type="text" name="content" id="content">
                <label for="illegalStatus">违规状态:</label> 
                <select id="illegalStatus" name="illegalStatus" class="easyui-combobox" style="width: 80px;" editable="false">
                    <option value="">全部</option>
                    <option value="0">正常</option>
                    <option value="1">违规</option>
                </select>
                <input type="button" onclick="searchComment()" value="查询" />
            </div>
        </form>
    </div> 
    <table id="dg" class="easyui-datagrid" style="height: 620px;"
            url="heartBeat/selectComment?hearId=${id}"
            toolbar="#toolbar" pagination="true" queryParams="form2Json('ff')"
            fitColumns="true" singleSelect="true" rownumbers="true"
            data-options="onClickRow: onClickRow,fit:false,border:false,pageSize:20,pageList:[20,50,100,200]" >
        <thead>
            <tr>
                <th field="insName" width="50" >评论人昵称</th>
                <th field="content" width="50">评论内容</th>
                <th field="opreaterIp" width="50">评论人IP</th>
                <th field="insYmdhms" width="50" formatter = "conversion">评论时间</th>
                <th field="illegalStatus" width="50" formatter = "formatStatus">违规状态</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
    <shiro:hasPermission name="HeartBeat:manager">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteComment()">删除</a>
    </shiro:hasPermission>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-tocomment',plain:true" onclick="toCommentReply()">回复管理</a>
    </div>
    <div id="dlg" class="easyui-dialog" style="padding:10px 20px;width: 800px;height: 550px;"
           closed="true" buttons="#dlg-buttons" modal="true">
        <iframe id='addAroundStoreFormUI' border='0' vspace='0' hspace='0' 
            marginwidth='0' marginheight='0' framespacing='0' frameborder='0' scrolling='yes' 
            style="height:100%;width:100%;left:10px;top:8px" src="">
        </iframe>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveSubmit()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">关闭</a>
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
           /* $('#ff').form('submit',{  
                url: "heartBeat/selectComment?hearId=${id}",  
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
                        $.post('heartBeat/deleteComment',{id:row.id,delFlag:'1'},function(result){
                            if (result.type=='Success'){
                            	$("#hotnumber").html(result.dataStr)
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
        function toCommentReply() {
            var rows = $('#dg').datagrid('getSelections');
            if(rows.length>1){
                $.messager.show({    // show error message
                    title: 'Warning',
                    msg: '请选择一条数据!'
                });
                return;
            }
            var row = rows[0];
            if (row){
                parent.$('#addUserFormUI').attr("src","heartBeat/toCommentReply/"+row.id+"/${id}");
                parent.$('#dlg').dialog('open').dialog('setTitle','随心拍评论的回复管理');
                
                /* $('#addAroundStoreFormUI').attr("src","heartBeat/toCommentReply/"+row.id+"/${id}");
                $('#dlg').dialog('open').dialog('setTitle','随心拍评论的回复管理'); */
            }else{
                $.messager.alert('提示信息','请先选择要进行回复管理的记录。','info');
            }
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
                $('#toolbar').append("<a href='javascript:void(0)' class='easyui-linkbutton' data-options=\"iconCls:'icon-tocomment',plain:true\" onclick='toCommentReply()'>回复管理</a>");
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