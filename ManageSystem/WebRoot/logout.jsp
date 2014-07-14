<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="logDao" scope="request" class="com.dreamer.dao.LogDao" />
<jsp:useBean id="logBean" scope="request" class="com.dreamer.bean.LogBean" />
<jsp:useBean id="Log" scope="request" class="com.dreamer.constant.Constant" />
<%@include file="./include/getUserInfo.jspf"%>
<%
session.removeAttribute("user_id");
session.removeAttribute("user_name");
session.removeAttribute("user_ip");
session.removeAttribute("superadmin");
session.removeAttribute("module_right");
session.removeAttribute("authority");
logBean.setUser(u_id);
logBean.setIpAddress(user_ip);
logBean.setType(Log.TYPE_LOGIN);
logBean.setOperate(Log.OP_LOGIN);
logBean.setResult(Log.RESULT_FAILURE);
logBean.setDescriptio("用户"+user_name+"退出系统");
logDao.add(logBean);
response.getWriter().write("{success:true,data:'安全退出'}");
session.invalidate();
%>
