package com.dreamer.dao;

import com.dreamer.bean.LogBean;

public class LogDao extends BaseDao{
	public void add(LogBean logBean) {
		initMySQL();
		try {
			sql = "insert into log (type, user, operate, description, result, ip_address) values (?, ?, ?, ?, ?, ?);";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, logBean.getType());
			preparedStatement.setInt(2, logBean.getUser());
			preparedStatement.setInt(3, logBean.getOperate());
			preparedStatement.setString(4, logBean.getDescriptio());
			preparedStatement.setInt(5, logBean.getResult());
			preparedStatement.setString(6, logBean.getIpAddress());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("插入登录日志异常！"+e);
		}finally{
			closeConnection();
		}
	}
}
