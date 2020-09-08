package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import vo.Score;

public class StudentDao {
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

	public ArrayList queryScore(String stuno) throws Exception {
		ArrayList scos = new ArrayList();
		
		this.initConnection();
		Statement stat = conn.createStatement();
		String sqltext = null;
		sqltext = "SELECT * FROM T_SCORESYSTEMSCORES SCO JOIN T_SCORESYSTEMCOURSES COU ON SCO.COUNO=COU.COUNO WHERE SCO.stuno = '"
				+ stuno + "';";
		System.out.println("StudentDao queryScore .sqltext = " + sqltext);
		ResultSet rs = stat.executeQuery(sqltext);

		while (rs.next()) {
			Score sco = new Score();
			sco.setChangeable(rs.getString("CHANGEABLE"));
			sco.setCoursename(rs.getString("COUNAME"));
			sco.setScore(rs.getString("SCORE"));
			scos.add(sco);
		}
		
		this.closeConnection();
		return scos;
	}
	
	public ArrayList getCourses() throws Exception{
		ArrayList courses = new ArrayList();
		this.initConnection();
		Statement stat = conn.createStatement();	
		
		String sqltext = "SELECT COU.COUNAME,COU.COUNO,TEA.NAME,TEA.ACCOUNT FROM T_SCORESYSTEMCOURSES COU JOIN T_SCORESYSTEMTEACHERS TEA ON TEA.ACCOUNT=COU.TEACHERNO;";
		System.out.println("StudentDao queryScore .sqltext = "+sqltext);
		ResultSet rs = stat.executeQuery(sqltext);	
		
		while(rs.next()){
			vo.Course course = new vo.Course();
			course.setCoursename(rs.getString("COUNAME"));
			course.setCourseno(rs.getString("COUNO"));
			course.setTeachername(rs.getString("NAME"));
			course.setTeacherno(rs.getString("ACCOUNT"));
			courses.add(course);
		}
		this.closeConnection();
		return courses;
	}
	
	public ArrayList getChoicedCourses(String stuno) throws Exception{
		ArrayList courses = new ArrayList();
		this.initConnection();
		Statement stat = conn.createStatement();
		
		String sqltext = "SELECT * FROM T_SCORESYSTEMSCORES WHERE STUNO='"+ stuno +"'";
		System.out.println("StudentDao getChoicedCourses .sqltext = "+sqltext);
		ResultSet rs = stat.executeQuery(sqltext);
		
		while(rs.next()){
			vo.Course course = new vo.Course();
			course.setCourseno(rs.getString("COUNO"));
			courses.add(course);
		}
		this.closeConnection();
		return courses;
	}
	
	public void choiceCourse(String stuno,String couno)throws Exception{
		this.initConnection();
		Statement stat = conn.createStatement();
		
		String sqltext = "INSERT INTO T_SCORESYSTEMSCORES(STUNO,COUNO,CHANGEABLE) VALUES('"+ stuno +"','"+ couno +"','yes')";
		System.out.println("StudentDao choiceCourse .sqltext = "+sqltext);
		stat.executeUpdate(sqltext);
		
		this.closeConnection();
	}
}


















