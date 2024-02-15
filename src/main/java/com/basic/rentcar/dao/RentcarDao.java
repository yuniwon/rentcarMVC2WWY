package com.basic.rentcar.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.basic.rentcar.vo.CarReserveVO;
import com.basic.rentcar.vo.CarViewVO;
import com.basic.rentcar.vo.RentcarVO;
import com.rentcar.test.util.DBUtil;


public class RentcarDao {
	private RentcarDao() {
	}

	private static RentcarDao dao = new RentcarDao();

	public static RentcarDao getInstance() {
		return dao;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	public int getMember(String id, String pw) {

		System.out.println("id= " + id + " pw=" + pw);
		int result = 0; 

		conn = DBUtil.getConnection();
		try {

			String sql = "SELECT * FROM member WHERE id=? and pw=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}
		return result;
	}

	
	public ArrayList<RentcarVO> getSelectCar() {
		
		ArrayList<RentcarVO> v = new ArrayList<RentcarVO>();

		try {
			
			conn = DBUtil.getConnection();

			String sql = "SELECT * FROM rentcar ORDER BY no DESC";
			// String sql = "SELECT * FROM rentcar ORDER BY no DESC LIMIT 3";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			int count = 0;
			while (rs.next()) {

				RentcarVO bean = new RentcarVO();
				bean.setNo(rs.getInt("no"));
				bean.setName(rs.getString("name"));
				bean.setCategory(rs.getInt("category"));
				bean.setPrice(rs.getInt("price"));
				bean.setUsepeople(rs.getInt("usepeople"));
				bean.setTotalQty(rs.getInt("total_qty"));
				bean.setCompany(rs.getString("company"));
				bean.setImg(rs.getString("img"));
				bean.setInfo(rs.getString("info"));
				
				v.add(bean);
				count++;
				
				if (count > 2)
					break; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}

		return v;
	}

	
	public RentcarVO getOneCar(int no) {
		
		RentcarVO bean = new RentcarVO();
		conn = DBUtil.getConnection();

		try {
			
			String sql = "SELECT * FROM rentcar WHERE no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("no=" + no );
				System.out.println("total qty=" + rs.getInt("total_qty"));
				bean.setNo(no);
				bean.setName(rs.getString("name"));
				bean.setCategory(rs.getInt("category"));
				bean.setPrice(rs.getInt("price"));
				bean.setUsepeople(rs.getInt("usepeople"));
				bean.setTotalQty(rs.getInt("total_qty"));
				bean.setCompany(rs.getString("company"));
				bean.setImg(rs.getString("img"));
				bean.setInfo(rs.getString("info"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}
		return bean;
	}

	
	public void setReserveCar(CarReserveVO bean) {

		
		conn = DBUtil.getConnection();
		int num = 0;
		try {

			String sql = "INSERT INTO carreserve ( no, id, qty, dday, rday, "
					+ "usein, usewifi, usenavi, useseat)" + " VALUES( ?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, bean.getNo()); //렌트카 고유번호
			pstmt.setString(2, bean.getId()); // 고객 id
			pstmt.setInt(3, bean.getQty()); // 렌트한 수량
			pstmt.setInt(4, bean.getDday()); // 대여기간
			pstmt.setString(5, bean.getRday()); // 대여일
			pstmt.setInt(6, bean.getUsein()); // 운전자보험여부
			pstmt.setInt(7, bean.getUsewifi()); //인터넷여부
			pstmt.setInt(8, bean.getUsenavi()); //네비게이션 여부
			pstmt.setInt(9, bean.getUseseat()); //베이비시트 적

			if(pstmt.executeUpdate() > 0) {
				updateRentcarQty(bean.getNo() ,bean.getQty());
				System.out.println("차량 예약 완료");
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}
	}

	private void updateRentcarQty(int no , int rentQty) {
		conn = DBUtil.getConnection();

		try {
			String sql = "update rentcar set total_qty =total_qty - ? where no = ?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, rentQty);
			pstmt.setInt(2, no);
		
			pstmt.executeUpdate();	
			
			System.out.println("수량 업데이트 완료");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}
	}
	public ArrayList<RentcarVO> getAllCar() {
		ArrayList<RentcarVO> v = new ArrayList<>();
		
		RentcarVO bean = null;

		conn = DBUtil.getConnection();
		try {
			String sql = "SELECT * FROM rentcar";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				bean = new RentcarVO();
				bean.setNo(rs.getInt("no"));
				bean.setName(rs.getString("name"));
				bean.setCategory(rs.getInt("category"));
				bean.setPrice(rs.getInt("price"));
				bean.setUsepeople(rs.getInt("usepeople"));
				bean.setTotalQty(rs.getInt("total_qty"));
				bean.setCompany(rs.getString("company"));
				bean.setImg(rs.getString("img"));
				bean.setInfo(rs.getString("info"));
				
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}
		return v;

	}

	
	public ArrayList<RentcarVO> getCategoryCar(int cate) {

		ArrayList<RentcarVO> v = new ArrayList<>();
		
		RentcarVO bean = null;

		conn = DBUtil.getConnection();
		try {
			String sql = "SELECT * FROM rentcar WHERE category=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cate);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				bean = new RentcarVO();
				bean.setNo(rs.getInt("no"));
				bean.setName(rs.getString("name"));
				bean.setCategory(rs.getInt("category"));
				bean.setPrice(rs.getInt("price"));
				bean.setUsepeople(rs.getInt("usepeople"));
				bean.setTotalQty(rs.getInt("total_qty"));
				bean.setCompany(rs.getString("company"));
				bean.setImg(rs.getString("img"));
				bean.setInfo(rs.getString("info"));
				
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}
		return v;
	}

	
	public ArrayList<CarViewVO> getAllReserve(String id) {

		ArrayList<CarViewVO> v = new ArrayList<>();
		CarViewVO bean = null;

		conn = DBUtil.getConnection();

		try {
			
			//select * from rentcar a2 ,carreserve a1  where a1.id = 'qwer' and curdate() < date_format(a1.rday , '%y-%m-%d') and a1.no = a2.no;
			// select * from rentcar a2 ,carreserve a1  where a1.id = 'qwer' and a1.no = a2.no;
			
			String sql = "select * from rentcar a2 ,carreserve a1  where a1.id = ? and a1.no = a2.no";
			System.out.println(id);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bean = new CarViewVO();
				bean.setNo(rs.getInt("no"));
				bean.setReserveSeq(rs.getInt("reserve_seq"));
				bean.setName(rs.getString("name"));
				bean.setPrice(rs.getInt("price"));
				bean.setImg(rs.getString("img"));
				bean.setQty(rs.getInt("qty"));
				bean.setDday(rs.getInt("dday"));
				bean.setRday(rs.getString("rday"));
				bean.setUsein(rs.getInt("usein"));
				bean.setUsewifi(rs.getInt("usewifi"));
				bean.setUsenavi(rs.getInt("usenavi"));
				bean.setUseseat(rs.getInt("useseat"));		
				v.add(bean);
				System.out.println(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}

		return v;
	}

	
	public void carRemoveReserve(int reserveSeq ,int qty , int no) {

		conn = DBUtil.getConnection();
		try {
			String sql = "DELETE FROM carreserve where reserve_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserveSeq);
			if(pstmt.executeUpdate()> 0 ) {
				backRentcarQty(no, qty);
				System.out.println("삭제 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}
	}
	
	// 삭제하면 다시 토탈 car 다시 업데이트 되야함 
	
	private void backRentcarQty(int no , int rentQty) {
		conn = DBUtil.getConnection();

		try {
			String sql = "update rentcar set total_qty =total_qty + ? where no = ?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, rentQty);
			pstmt.setInt(2, no);
		
			pstmt.executeUpdate();	
			
			System.out.println("rentQty= " + rentQty);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}
	}


	public boolean checkLogin(String id, String pw) {
		conn = DBUtil.getConnection();
		try {
			String sql = "select * from member where id=? and pw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			System.out.println("로그인");
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbclose(conn, pstmt, rs);
		}
		
		return false;
	}


	

	
}
