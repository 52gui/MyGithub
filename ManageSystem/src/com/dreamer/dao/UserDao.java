package com.dreamer.dao;

import com.dreamer.bean.UserBean;
/**
 * 该类为用户的操作类
 * @author Dreamer
 *
 */
public class UserDao extends BaseDao{
	private UserBean userBean;

	public UserDao(){
		userBean = new UserBean();
		initMySQL();
	}
	
	public UserDao(UserBean userBean){
		this.userBean = userBean;
		initMySQL();
	}
	
	/**
	 * 设置当前的UserBaen
	 * @param userBean
	 */
	
	public void setCurrentUser(UserBean userBean){
		this.userBean = userBean;
	}
	
	/**
	 * 用户登录校验方法
	 * id为返回的标记，为0时数据库连接错误，为-1时用户不存在，为-2时用户名存在但是密码不正确，为-3时表示用户不可用（enabled字段被置为0了）
	 */
	public void verifyUser(){
		String strPassword = "";
		initMySQL();
		sql = "select * from user where login_name=?";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userBean.getLoginName());
			resultSet = preparedStatement.executeQuery();
			if (!resultSet.next()) {
				userBean.setId(-1);
				closeConnection();
				return;
			}
			strPassword = resultSet.getString("password");
			if (!strPassword.equals(userBean.getPassword())){
				userBean.setId(-2);
				closeConnection();
				return;
			}
			if (resultSet.getInt("enabled")==0) {
				userBean.setId(-3);
				closeConnection();
				return;
			}
			userBean.setId(resultSet.getInt("id"));
			userBean.setName(resultSet.getString("name"));
			userBean.setLoginTimes(resultSet.getInt("login_times"));
			userBean.setLastLoginIP(resultSet.getString("last_login_ip"));
			userBean.setSuperAdmin(resultSet.getString("superadmin"));
			userBean.setModuleRight(resultSet.getInt("module_right"));
			userBean.setAuthority(resultSet.getInt("authority"));
			closeConnection();
			return;
		} catch (Exception e) {
			// TODO: handle exception
			userBean.setId(0);
			closeConnection();
			System.out.println("获取结果集异常！"+e);
		} 
	}
	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}
}
