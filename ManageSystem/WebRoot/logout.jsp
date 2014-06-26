<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
session.removeAttribute("user_id");
session.removeAttribute("user_name");
response.getWriter().write("{success:true,data:'安全退出'}");
session.invalidate();
%>
