<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>显示用户信息</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
</head>
<body>
<div id="templatemo_wrapper">
<div id="templatemo_content">
<div class="post_section">        
            <h2>显示用户信息</h2>            
      <div class="post_content"><a ><img src="images/templatemo_image_01.jpg" alt="image" /></a>
        <p>
		 <table>
   <s:iterator value="list" id="name" status="status">			 				
				<tr <s:if test="#status.odd">style="background-color:yellow"</s:if>>
					<td>学号：<s:property value="id"/></td>
					<td>姓：<s:property value="firstname"/></td>
					<td>名：<s:property value="lastname"/></td>
					<td>年龄：<s:property value="age"/></td>
				</tr>
	</s:iterator>
	</table>       
		
		
		</p>
      </div>
    </div>                
  </div>
</div> 
</body>
</html>
