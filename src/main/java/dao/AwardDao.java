package dao;

import bean.Award;
import bean.AwardRecord;

/**
 * @Description: 奖品、奖品记录接口
 * @Author: redcomet
 * @Date: 2018-12-23-11:11
 */

public interface AwardDao {

    public void addAwardRecord(AwardRecord record);

    public Award findAwardByIndex(int index);  //查找奖品信息

    public void updateAward(Award award);  //更新奖品信息


}
