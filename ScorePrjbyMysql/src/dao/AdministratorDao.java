package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class AdministratorDao {
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
	//�����ѯ������һ��ArrayList���ڴ�ŵ���һ����ѧ��Ķ���ѧ������д��ΪVO

}
