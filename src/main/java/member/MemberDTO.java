package member;

/*
RegisterDTO.java
작성날짜 : 2022-09-13
작성자 : 김례화
*/

public class MemberDTO {
    private int id_no;
	private String id;//회원 id
	private String password;//암호
	private String gender;//성별
	private String birth;//생년월일
	private String phone;//전화번호
	private String email;//이메일
	private String kakaotalk;//카카오톡
	
	
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
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
	public String getKakaotalk() {
		return kakaotalk;
	}
	public void setKakaotalk(String kakaotalk) {
		this.kakaotalk = kakaotalk;
	}
	

	
	
}