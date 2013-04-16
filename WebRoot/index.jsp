<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理系统</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
</head>
<body>
<div id="templatemo_wrapper">
<div id="templatemo_content">
<div class="post_section">        
            <h2>添加用户与显示用户</h2>            
      <div class="post_content"><a ><img src="images/templatemo_image_01.jpg" alt="image" /></a>
        <p> 
        <s:a href="save.jsp">添加用户</s:a><br/>
    	<s:a href="list.action">查询所有用户信息</s:a>
		</p>
      </div>
    </div>                
  </div>
</div> 
</body>
</html>