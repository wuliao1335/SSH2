<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  <link rel="stylesheet" type="text/css" href="../styles/basic.css">
  <link rel="stylesheet" type="text/css" href="../styles/ui.jqgrid.css">
  <link rel="stylesheet" type="text/css" href="../styles/start/jquery-ui-1.8.5.custom.css" />
  <script type="text/javascript" src="../scripts/jquery-1.4.2.min.js"></script>
  <script type="text/javascript" src="../scripts/jquery-ui-1.8.5.min.js"></script>
  <script type="text/javascript" src="../scripts/i18n/grid.locale-cn.js" charset="utf-16"></script>
  <script type="text/javascript" src="../scripts/jquery.jqgrid.min.js" charset="utf-8"></script>
  </head>
  
  <body> 
    <div id="tabs">
      <ul>
        <li><a href="#tab-1">管理员列表</a></li>
        <li><a href="#tab-2">添加管理员</a></li>
        <li><a href="#tab-3">修改管理员</a></li>
      </ul>
      <div id="tab-1">
		    <table id="grid" class="table" width="100%" cellspacing=0 cellpadding=0>
		    </table>
		    <div id="page"></div>
	    </div>
	    <div id="tab-2">
	      <form action="add.action" method="post" id="add_form">
	      <s:hidden name="admin.id"/>
	      <table class="table" width="100%" cellspacing=0 cellpadding=0>
		      <tr class="tr">
		        <th class="th" colspan="4" align="left">　管理员信息</th>
		      </tr>
		      <tr class="tr">
		        <td class="td">用户名:</td><td class="td"><s:textfield name="admin.adminname" /></td>
		        <td class="td">密     码:</td><td class="td"><s:textfield name="admin.password" /></td>
		        
		      </tr>
          <tr class="tr">
            <td class="td" style="height:90px;" colspan="4" align="center"><button id="add_save">保　存</button>　　　　<button id="add_reset">重　置</button></td>
          </tr>     
	      </table>
	      </form>
	    </div>
	    <div id="tab-3">
	      <form action="modify.action" method="post" id="mod_form">
	       <s:hidden name="admin.id" id="adminid"/>
	      <table class="table" width="100%" cellspacing=0 cellpadding=0>
		      <tr class="tr">
		        <th class="th" colspan="4" align="left">　管理员信息</th>
		      </tr>
		      <tr class="tr">
		        <td class="td">用户名:</td><td class="td"><s:textfield id="adminadminname" name="admin.adminname" /></td>
		        <td class="td">密     码:</td><td class="td"><s:textfield id="adminpassword" name="admin.password" /></td>
		      </tr>
          <tr class="tr">
            <td class="td" style="height:90px;" colspan="4" align="center"><button id="mod_save">保　存</button>　　　　<button id="mod_reset">重　置</button></td>
          </tr>     
	      </table>
	      </form>
	    </div>
    </div>
    <script type="text/javascript">
    $(function(){
        $('#tabs').height($(window).height()-10);
        $('#tabs').tabs();
        $('#tabs').tabs('disable',2)
        $('button').button();
       
        init_table();
        init_add();
        init_mod();
         
              
    });
    
    function init_add(){
      $('#add_save').click(function(){
        	$('#add_form').submit();
             return false;
        });
      $('#add_reset').click(function(){
	        $('#tabs').tabs( "select" , 0);
	         return false;
        });   
    }
    
    function init_mod(){
      $('#mod_save').click(function(){
          $('#mod_form').submit();
          return false;
      });
      $('#mod_reset').click(function(){
          $('#tabs').tabs("select",0);
          $('#tabs').tabs('disable',2);
          return false;
      });
    }
    
    function init_table(){
    	$("#grid").jqGrid({
    	  url:'list',
    	  datatype : "json",
   	    colModel:[
   	      {name:'like.id',jsonmap:"id",label:'编号',width:40,align:"left"},
          {name:'like.adminname',jsonmap:"adminname",label:'用户名',width:60,align:"left"},
   	      {name:'like.password',jsonmap:"password",label:'密码',width:175,align:"left"},
   	      
   	    ],
   	    scroll: true,
   	    pager: '#page',
   	    viewrecords: true,
    	  caption: "管理员查询结果",
    	  width: $(window).width()-40,
    	  height: $(window).height()-170,
    	  forceFit : true,
    	  multiselect:true,
    	  jsonReader:{
    		  repeatitems : false
        },
        ondblClickRow:function(id,row,col,e){
          
          load(id,function(){
              $('#tabs').tabs('enable',2);
              $('#tabs').tabs("select",2);
          });
        }
    	});
    	$('#grid').navGrid('#page',{
        	add:false,
        	edit:false,
        	search:false,
        	delfunc:function(ids){
    		    remove(ids);
        	}
    	});
    	$('#grid').filterToolbar();
    }   
    function remove(id){
       alert(id);
    }
    function load(id,callback){
     $.getJSON('load',{id:id},function(data,status,xhr){
     
         var admin = data.admin;
         for(var v in admin){
         alert(admin[v]);
           try{$('#admin'+v).val(admin[v]);}catch(e){alert(e);}
         }
        callback();
      });
    }
    
    </script>
  </body>
</html>

