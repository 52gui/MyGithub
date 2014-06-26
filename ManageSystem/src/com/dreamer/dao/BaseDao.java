package com.dreamer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
/**
 * 数据库操作的基类，封装数据库的基本操作
 * @author Dreamer
 *
 */
public class BaseDao {
	protected String sql = "";
	protected Context initContext,envContext;
	protected DataSource dataSource;
	protected Connection connection;
	protected PreparedStatement preparedStatement;
	protected ResultSet resultSet;
	/**
	 * 初始化数据库连接
	 */
	protected void initMySQL(){
		try{
			initContext = new InitialContext();
			envContext = (Context)initContext.lookup("java:/comp/env");
			dataSource = (DataSource)envContext.lookup("jdbc/ManageSystem");
			connection = dataSource.getConnection();
		}catch (Exception e) {
			System.out.println("数据库连接池初始化异常！"+e);
		}
	}
	/**
	 * 关闭数据库连接
	 */
	protected void closeConnection() {
		try {
			if(resultSet!=null){
				resultSet.close();
			}
			if(preparedStatement!=null){
				preparedStatement.close();
			}
			if(connection!=null){
				connection.close();
			}
		} catch (Exception e) {
			System.out.println("关闭数据库连接资源异常！"+e);
		}
	}
}
