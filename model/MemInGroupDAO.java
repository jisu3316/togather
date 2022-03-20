package team1.togather.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import team1.togather.domain.MemInGroup;

public class MemInGroupDAO {

	private DataSource ds;
	MemInGroupDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
		}
	}
	boolean MemInGroupJoin(MemInGroup dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "Insert into MEM_IN_GROUP values(?,?,default)";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, dto.getgSeq());
			pstmt.setLong(2, dto.getmNum());
			int i = pstmt.executeUpdate();
			if(i>0) {
				return true;
			}else {
				return false;
			}		
		}catch(SQLException se) {
			System.out.println("#GroupInsert() se: " + se);
			return false;
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt !=null) pstmt.close();
			}catch(SQLException se) {}
		}
	}
	boolean MemInGroupDel(long gSeq, long mnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from MEM_IN_GROUP where gseq =? and MNUM = ?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, gSeq);
			pstmt.setLong(2, mnum);
			int i = pstmt.executeUpdate();
			if(i>0) {
				return true;
			}else {
				return false;
			}		
		}catch(SQLException se) {
			System.out.println("#GroupInsert() se: " + se);
			return false;
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt !=null) pstmt.close();
			}catch(SQLException se) {}
		}
	}
	boolean MemInGroupDel(long gSeq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from MEM_IN_GROUP where gseq =?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, gSeq);
			int i = pstmt.executeUpdate();
			if(i>0) {
				return true;
			}else {
				return false;
			}		
		}catch(SQLException se) {
			System.out.println("#GroupInsert() se: " + se);
			return false;
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt !=null) pstmt.close();
			}catch(SQLException se) {}
		}
	}
	
}
	

