package dao;

import bean.Award;
import bean.AwardRecord;

import java.util.List;

/**
 * @Description: 奖品、奖品记录接口
 * @Author: redcomet
 * @Date: 2018-12-23-11:11
 */

public interface AwardDao {

    public void addAwardRecord(AwardRecord record);

    public List<Award> findAllAwards();

    public Award findAwardByIndex(int index);  //查找奖品信息

    public void updateAward(Award award);  //更新奖品信息

    public List<AwardRecord> findAllAwardRecords();  //查找所有中奖信息

    public AwardRecord findAwardRecordById(int id);  //查找中奖纪录

    public void updateAwardRecord(AwardRecord record);  //更新奖品信息
}
