package daoImpl;

import bean.Award;
import bean.AwardRecord;
import dao.AwardDao;
import util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AwardDaoImpl implements AwardDao {
	public void addAwardRecord(AwardRecord record) {
		String sql = "insert into tb_award_record(award_index,userid,finished,column1,column2) values(?,?,?,?,?)";
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, record.getAwardIndex());
			pstmt.setString(2, record.getUserId());
			pstmt.setString(3, "0");
			pstmt.setInt(4, 0);
			pstmt.setString(5, "");
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
	}

	public Award findAwardByIndex(int index) {
		String sql = "select * from tb_award where `index` = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection connection = null;
		Award award = null;
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,index);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				award=new Award();
				award.setIndex(rs.getInt(1));
				award.setAwardName(rs.getString(2));
				award.setStock(rs.getInt(3));
				award.setImage(rs.getString(4));
				award.setColumn1(rs.getInt(5));
				award.setColumn2(rs.getString(6));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return award;
	}

	public void updateAward(Award award) {
		String sql = "update tb_award_record set stock = ? where `index` = ?";
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, award.getStock());
			pstmt.setInt(2, award.getIndex());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
	}

	public List<Award> findAllAwards() {
		List<Award> awards=new ArrayList();
		Award award=null;
		Connection connection=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_award";
		try {
			connection=JDBCUtil.getConnection();
			pstmt=connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				award = new Award();
				award.setIndex(rs.getInt(1));
				award.setAwardName(rs.getString(2));
				award.setStock(rs.getInt(3));
				award.setImage(rs.getString(4));
				award.setColumn1(rs.getInt(5));
				award.setColumn2(rs.getString(6));
				awards.add(award);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}

		return awards;
	}

}
