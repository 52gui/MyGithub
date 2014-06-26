<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="./include/getUserInfo.jspf"%>
<%
session.removeAttribute("user_id");
session.removeAttribute("user_name");
session.removeAttribute("user_ip");
session.removeAttribute("superadmin");
session.removeAttribute("module_right");
session.removeAttribute("module_right");
response.getWriter().write("{success:true,data:'安全退出'}");
session.invalidate();
%>
