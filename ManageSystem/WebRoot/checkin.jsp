<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dreamer.dao.UserDao"%>
<jsp:useBean id="userBean" scope="request" class="com.dreamer.bean.UserBean" />
<jsp:useBean id="userDao" scope="request" class="com.dreamer.dao.UserDao" />
<jsp:useBean id="logBean" scope="request" class="com.dreamer.bean.LogBean" />
<jsp:useBean id="logDao" scope="request" class="com.dreamer.dao.LogDao" />
<jsp:useBean id="Log" scope="request" class="com.dreamer.constant.Constant" />
<jsp:useBean id="MD5" class="com.dreamer.encode.MD5" />
<%
/*该文件用于extjs页面登录校验跳转*/
try {
	String login_name = request.getParameter("username");
	String password = request.getParameter("password");
	String rand = request.getParameter("rand");
	String ip = request.getRemoteAddr();
	userBean.setLoginName(login_name);
	userBean.setPassword(password);
	String server_rand = (String)session.getAttribute("rand");
	if (login_name==null || login_name.equals("")) {
		response.getWriter().write("{success:false,data:'用户名不能为空！'}");
		return;
	}
	if (password==null || password.equals("")) {
		response.getWriter().write("{success:false,data:'密码不能为空！'}");
		return;
	}
	if(rand==null || rand.equals("") || !rand.equals(server_rand)){
		System.out.println("用户 "+login_name+" 验证码错误！");
		response.getWriter().write("{success:false,item:2,data:'验证码错误！'}");
		return;
	}
	userDao.setCurrentUser(userBean);
	userDao.verifyUser();
	if(userDao.getUserBean().getId()==0){
		response.getWriter().write("{success:false,data:'数据库错误！请与系统管理员联系！'}");
		return;
	}
	if(userDao.getUserBean().getId()==-1){
		response.getWriter().write("{success:false,data:'用户名不存在！'}");
		return;
	}
	if(userDao.getUserBean().getId()==-2){
		response.getWriter().write("{success:false,data:'登录密码错误！'}");
		return;
	}
	if(userDao.getUserBean().getId()==-3){
		response.getWriter().write("{success:false,data:'用户不可用，请联系管理员！'}");
		return;
	}
	session.setAttribute("user_id",new Integer(userDao.getUserBean().getId()));
	session.setAttribute("login_name",userDao.getUserBean().getName());
	session.setAttribute("user_ip",ip);
	session.setAttribute("superadmin",new Integer(userDao.getUserBean().getSuperAdmin()));
	session.setAttribute("module_right",new Integer(userDao.getUserBean().getModuleRight()));
	session.setAttribute("authority",new Integer(userDao.getUserBean().getAuthority()));
	String json="{";
	json+="success:true,";
	json+="username:'"+login_name+"',";
	json+="user_id:'"+userDao.getUserBean().getId()+"',";
	json+="data:'成功！'";
	json+="}";
	logBean.setUser(userDao.getUserBean().getId());
	logBean.setIpAddress(ip);
	logBean.setType(Log.TYPE_LOGIN);
	logBean.setOperate(Log.OP_LOGIN);
	logBean.setResult(Log.RESULT_SUCCESS);
	logBean.setDescriptio("用户"+login_name+"登录系统");
	logDao.add(logBean);
	response.getWriter().write(json);
} catch (Exception ex) {
 	System.out.println("用户登录发生错误:\n"+ex);
 	logBean.setResult(Log.RESULT_FAILURE);
 	
 	response.getWriter().write("{success:false,data:'系统错误！'}");
}%>