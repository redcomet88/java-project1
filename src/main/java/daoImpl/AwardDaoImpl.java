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
		String sql = "update tb_award set stock = ? where award_index = ?";
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;

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

	public List<AwardRecord> findAllAwardRecords(){
		List<AwardRecord> records=new ArrayList();
		AwardRecord record=null;
		Connection connection=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select  a.*,b.award_name,c.employeeName  from  tb_award_record a, tb_award b,tb_employee c  " +
				"where a.award_index = b.`index` and a.userid = c.employeeId";
		try {
			connection=JDBCUtil.getConnection();
			pstmt=connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				record = new AwardRecord();
				record.setId(rs.getInt(1));
				record.setAwardIndex(rs.getInt(2));
				record.setUserId(rs.getString(3));
				if(null == rs.getString(4)|| "0".equals(rs.getString(4)))
				{
					record.setFinished("未兑奖");
				}
				else
				{
					record.setFinished("已兑奖");
				}
				//record.setFinished(rs.getString(4));
				record.setColumn1(rs.getInt(5));
				record.setColumn2(rs.getString(6));
				record.setAwardName(rs.getString(7));
				record.setUserName(rs.getString(8));
				records.add(record);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}

		return records;
	}

	public AwardRecord findAwardRecordById(int id){


		System.out.println(id);

		String sql = "select * from tb_award_record where `id` = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection connection = null;
		AwardRecord record = new AwardRecord();
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				record.setId(rs.getInt(1));
				record.setAwardIndex(rs.getInt(2));
				record.setUserId(rs.getString(3));
				record.setFinished(rs.getString(4));
				record.setColumn1(rs.getInt(5));
				record.setColumn2(rs.getString(6));
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
		return record;
	}


	public void updateAwardRecord(AwardRecord record){
		String sql = "update tb_award_record set finished = ? where id = ?";
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, record.getFinished());
			pstmt.setInt(2, record.getId());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
		}
	}

}
