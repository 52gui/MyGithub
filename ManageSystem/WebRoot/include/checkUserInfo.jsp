<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page pageEncoding="GBK"%>
<%
	Integer user_id = (Integer) session.getAttribute("user_id");
	if(user_id==null || user_id.intValue()==0){
		response.getWriter().write("{success:true,data:'登录时间过长，请返回重新登录！',type:'2'}");
	}else{
		response.getWriter().write("{success:true,data:'检查登录成功',type:'1'}");
	}
%>