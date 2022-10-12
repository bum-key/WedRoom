package kbk.board;

import java.sql.*;
import java.util.*;

import kbk.board.*;

//DBConnectionMgr(DB관리(10개)),
//BoardDTO(데이터를 입력받아서 저장,메소드 호출(매개변수,반환형))

public class MemberDAO {
	
	private DBConnectionMgr pool = null;//1.객체 생성할 멤버변수선언
	//공통
	private Connection con =null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;//select
	private String sql="";//실행시킬 sql구
	
	//2,생성자를 통해서 연결-> 의존관계
	public MemberDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
			System.out.println("pool=>"+pool);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("DB접속오류=>"+e);
		}
	}
	public int getMemberCount() {
		int x=0;//총 회원
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			sql="select count(*) from member;";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("getArticleCount() 에러유발=>"+e);
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return x;
	}
	
	
	public List<MemberDTO>getMembers(int start,int end) throws SQLException{
		List<MemberDTO> memberList =null;
		
		sql="select * from member limit ?,?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, start-1);//mysql은 레코드순번이 0부터 시작함
		pstmt.setInt(2, end);//불러와서 담을 갯수(ex 10)
		rs=pstmt.executeQuery();
		if(rs.next()) {//보여주는 결과가 있다면
			//10개씩 끊어서
			memberList=new ArrayList(end);//10->end갯수만큼 데이터담을 공간생성
			do {
				 MemberDTO members=new MemberDTO();//new MemberDTO();필드별로 담기위해서
				 members.setId(rs.getString("id"));
                 members.setPassword(rs.getString("passwd")); 
                 members.setEmail(rs.getString("e_mail")); 
                 members.setPhone(rs.getString("phone")); 
                 members.setKakako(rs.getString("kakao")); 
                 members.setGender(rs.getString("gender")); 
                 memberList.add(members); 
			 }while(rs.next());
		}
		try {
			con=pool.getConnection();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("getArticles에러유발=>"+e);
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return memberList;
	}
}
