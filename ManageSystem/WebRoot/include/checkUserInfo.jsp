<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page pageEncoding="GBK"%>
<%
	Integer user_id = (Integer) session.getAttribute("user_id");
	if(user_id==null || user_id.intValue()==0){
		response.getWriter().write("{success:true,data:'��¼ʱ��������뷵�����µ�¼��',type:'2'}");
	}else{
		response.getWriter().write("{success:true,data:'����¼�ɹ�',type:'1'}");
	}
%>