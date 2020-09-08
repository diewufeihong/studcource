package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.Cookie;

import vo.User;

public class FunctionDao {
	private Connection conn = null;
	private void initConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","test","123456");				
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	private void closeConnection(){
		try{
			conn.close();			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	public Cookie createCookie(String cookiename , String cookieinfo , int cookietime){
		Cookie createdCookie = new Cookie(cookiename,cookieinfo);
		createdCookie.setMaxAge(cookietime);	
		createdCookie.setPath("/");
		return createdCookie;
}

	
	public User getUsersFormAccountPassword(String account , String password ,String identity) {
		this.initConnection();
		User user = new User();
		String tablename =null;
		user.setIdentity(identity);
		Statement stat;
		
		
		try {
			stat = conn.createStatement();
			if (identity.equals("student")) {
				tablename = "T_SCORESYSTEMSTUDENTS";
			} else if (identity.equals("teacher")) {
				tablename = "T_SCORESYSTEMTEACHERS";
			} else if (identity.equals("adminstrator")) {
				tablename = "T_SCORESYSTEMADMINS";
			}

			String sqltext = "SELECT * FROM " + tablename + " WHERE ACCOUNT= '"
					+ account + "' AND PASSWORD='" + password + "';";

			System.out
					.println("getUsersFormAccountPassword is Running ...sqltext = "
							+ sqltext);

			ResultSet rs = stat.executeQuery(sqltext);

			if (rs.next()) {
				user.setUsersaccount(account);
				user.setUsersname(rs.getString("NAME"));
				if (identity.equals("student")) {
					user.setSex(rs.getString("SEX"));
				} else if (identity.equals("teacher")) {
					user.setSex(rs.getString("TITLE"));
				}
				this.closeConnection();
				return user;
			} else {
				this.closeConnection();
				System.out.println("getUsersFormAccountPassword is Running¡£select user is null¡£");
				return null;
			}
		} catch (SQLException e) {
			this.closeConnection();
			e.printStackTrace();
			return null;
		}
	}

}

