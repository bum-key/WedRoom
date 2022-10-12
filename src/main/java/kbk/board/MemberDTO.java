package kbk.board;//기능별로 분리->패키지 필요

public class MemberDTO {

	private int id_no; //일련번
	private String id;//회원 id
	private String password;//암호
	private String gender;//성별
	private int age;//나이
	private String phone;//연락처
	private String email;//이메일
	private String kakako;//카톡오픈채팅주소
	
	
	public int getId_no() {
		return id_no;
	}
	public void setId_no(int id_no) {
		this.id_no = id_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getKakako() {
		return kakako;
	}
	public void setKakako(String kakako) {
		this.kakako = kakako;
	}
	
	
	
}
