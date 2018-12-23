package bean;

/**
 * @Description: 奖品记录表
 * @Author: redcomet
 * @Date: 2018-12-23-11:00
 */

public class AwardRecord {
    private int id;
    private int awardIndex;
    private String userId;
    private String finished;
    private int column1;
    private String column2;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAwardIndex() {
        return awardIndex;
    }

    public void setAwardIndex(int awardIndex) {
        this.awardIndex = awardIndex;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFinished() {
        return finished;
    }

    public void setFinished(String finished) {
        this.finished = finished;
    }

    public int getColumn1() {
        return column1;
    }

    public void setColumn1(int column1) {
        this.column1 = column1;
    }

    public String getColumn2() {
        return column2;
    }

    public void setColumn2(String column2) {
        this.column2 = column2;
    }
}
