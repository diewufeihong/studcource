package vo;

public class User {
	private String usersaccount;
	private String identity;
	private String usersname;
	private String title;
	private String sex;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getUsersaccount() {
		return usersaccount;
	}
	public void setUsersaccount(String usersaccount) {
		this.usersaccount = usersaccount;
	}
	public String getUsersname() {
		return usersname;
	}
	public void setUsersname(String usersname) {
		this.usersname = usersname;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
}
