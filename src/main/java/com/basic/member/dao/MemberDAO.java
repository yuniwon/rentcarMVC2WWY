package com.basic.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rentcar.test.util.DBUtil;

import _04_rentcar.MemberVO;

public class MemberDAO {
	
	private MemberDAO() {}
	
	static private MemberDAO insetance = new MemberDAO();
	static public MemberDAO getInstance() {
		return insetance;
	}
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public int memberInsert(MemberVO m) {
		conn = DBUtil.getConnection();
		
		int cnt = -1;
		try {
			String sql="insert into member(id,pw,email,tel,hobby,job,age,info) values(?,?,?,?,?,?,?,?)";
			ps= conn.prepareStatement(sql);
			ps.setString(1, m.getId());
			ps.setString(2, m.getPw());
			ps.setString(3, m.getEmail());
			ps.setString(4, m.getTel());
			ps.setString(5, m.getHobby());
			ps.setString(6, m.getJob());
			ps.setString(7, m.getAge());
			ps.setString(8, m.getInfo());
			cnt = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			DBUtil.dbclose(conn, ps, rs);
		}
		
		return cnt;
	}

	public int confirmId(String id) {
		conn = DBUtil.getConnection();
		
		try {
			String sql = "select no from member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println("중복아이디 있음");
				return 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbclose(conn, ps, rs);
		}
		
		return 0;
	}
	
	
	
}
