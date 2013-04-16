<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
</head>
<body>
<div id="templatemo_wrapper">
<div id="templatemo_content">
<div class="post_section">        
            <h2>添加用户</h2>            
      <div class="post_content"><a ><img src="images/templatemo_image_01.jpg" alt="image" /></a>
        <p>
		<s:form action="SaveUser">
		<s:textfield name="user.id" label="学号"></s:textfield>
	    <s:textfield name="user.firstname" label="姓"></s:textfield>
	    <s:textfield name="user.lastname" label="名"></s:textfield>
	    <s:textfield name="user.age" label="年龄"></s:textfield>
	    <s:submit value="保存"></s:submit>
   </s:form>
		
		
		</p>
      </div>
    </div>                
  </div>
</div> 
</body>
</html>