package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import vo.Course;
import vo.Score;

public class TeacherDao {
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

	public ArrayList queryTeachCourse(String teacherno) throws Exception{
		ArrayList courses = new ArrayList();
		this.initConnection();
		Statement stat = conn.createStatement();	
		
		
		String sqltext = null;
		sqltext = "SELECT * FROM T_SCORESYSTEMCOURSES WHERE TEACHERNO ='" + teacherno + "';";
		System.out.println("TeacherDao queryTeachCourse .sqltext = " + sqltext);
				
		ResultSet rs = stat.executeQuery(sqltext);	
		while(rs.next()){
			vo.Course course = new Course();
			course.setCoursename(rs.getString("COUNAME"));
			course.setCourseno(rs.getString("COUNO"));
			courses.add(course);
		}
		this.closeConnection();
		return courses;
	}
	
	public ArrayList queryCourseScore(String couno,String teacherno) throws Exception{
		ArrayList scores = new ArrayList();
		this.initConnection();
		Statement stat = conn.createStatement();	
		
		String sqltext = null;
		sqltext = "SELECT * FROM T_SCORESYSTEMSCORES SCO JOIN T_SCORESYSTEMSTUDENTS STU ON SCO.STUNO=STU.ACCOUNT JOIN T_SCORESYSTEMCOURSES COU ON COU.COUNO=SCO.COUNO WHERE COU.TEACHERNO = '"+teacherno +"' AND SCO.COUNO = '"+couno + "';";
		System.out.println("TeacherDao queryCourseScore .sqltext = " + sqltext);				
		
		ResultSet rs = stat.executeQuery(sqltext);
		while(rs.next()){
			vo.Score score = new Score();
			String scorestr = rs.getString("SCORE");
			if(scorestr==null){
				scorestr="";
			}
			score.setScore(scorestr);
			score.setChangeable(rs.getString("CHANGEABLE"));
			score.setStuno(rs.getString("STUNO"));
			score.setStuname(rs.getString("NAME"));
			scores.add(score);
		}
		this.closeConnection();
		return scores;
	}
	
	public boolean setCourseScore(String couno, String[] stunos, String[] scores) {
		this.initConnection();
		try {
			Statement stat = conn.createStatement();

			for (int i = 0; i < stunos.length; i++) {
				if (!scores[i].equals("")) {
					String sql = "update T_SCORESYSTEMSCORES set SCORE="
							+ scores[i] + " where STUNO='" + stunos[i]
							+ "' and COUNO='" + couno
							+ "' and CHANGEABLE='yes'";
					System.out.println(" TeacherDAO setCourseScore .sqltext = "
							+ sql);
					stat.executeUpdate(sql);
				}
			}
			this.closeConnection();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			this.closeConnection();
			return false;
		}
	}

	public boolean setCourseScoreCommitted(String couno, String[] stunos) {
		this.initConnection();
		try {
			Statement stat = conn.createStatement();
			for (int i = 0; i < stunos.length; i++) {
				String sql = "update T_SCORESYSTEMSCORES set CHANGEABLE='no' where STUNO = '"
						+ stunos[i] + "' and COUNO = '" + couno + "'";
				System.out
						.println(" TeacherDAO setCourseScoreCommitted .sqltext = "
								+ sql);
				stat.executeUpdate(sql);
			}
			this.closeConnection();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			this.closeConnection();
			return false;
		}
	}
}
