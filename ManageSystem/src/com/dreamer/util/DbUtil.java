package com.dreamer.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbUtil {
	private static Connection connection = null;
	private static Context initContext,envContext;
	private static DataSource dataSource;
	public static Connection getConnection() {
		try {
			initContext = new InitialContext();
			envContext = (Context)initContext.lookup("java:/comp/env");
			dataSource = (DataSource)envContext.lookup("jdbc/ManageSystem");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			System.out.println("数据库连接异常！"+e);
		}
		return connection;
	}
}
