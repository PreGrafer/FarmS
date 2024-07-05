package com.github.pregrafer.project.sign.domain;

        import java.util.Date;
        import com.fasterxml.jackson.annotation.JsonFormat;
        import org.apache.commons.lang3.builder.ToStringBuilder;
        import org.apache.commons.lang3.builder.ToStringStyle;
        import com.github.pregrafer.framework.aspectj.lang.annotation.Excel;
        import com.github.pregrafer.framework.web.domain.BaseEntity;

/**
 *
 * @author lsj
 * @date 2024-07-02
 */
public class AttendanceRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;



    /** 正常签到次数 */
    private Integer normalSignInCount;

    /** 早退迟到次数 */
    private Integer earlyLeaveAndLateArrivalCount;

    /** 请假天数 */
    private Integer leaveDays;

    public Integer getLastNormalSignInCount() {
        return LastNormalSignInCount;
    }

    public void setLastNormalSignInCount(Integer lastNormalSignInCount) {
        LastNormalSignInCount = lastNormalSignInCount;
    }

    public Integer getLastEarlyLeaveAndLateArrivalCount() {
        return lastEarlyLeaveAndLateArrivalCount;
    }

    public void setLastEarlyLeaveAndLateArrivalCount(Integer lastEarlyLeaveAndLateArrivalCount) {
        this.lastEarlyLeaveAndLateArrivalCount = lastEarlyLeaveAndLateArrivalCount;
    }

    public Integer getLastLeaveDays() {
        return lastLeaveDays;
    }

    public void setLastLeaveDays(Integer lastLeaveDays) {
        this.lastLeaveDays = lastLeaveDays;
    }

    /** 上个月正常签到次数 */
    private Integer LastNormalSignInCount;

    /** 上个月早退迟到次数 */
    private Integer lastEarlyLeaveAndLateArrivalCount;

    /** 上个月请假天数 */
    private Integer lastLeaveDays;

    public Integer getNormalSignInCount() {
        return normalSignInCount;
    }

    public void setNormalSignInCount(Integer normalSignInCount) {
        this.normalSignInCount = normalSignInCount;
    }

    public Integer getEarlyLeaveAndLateArrivalCount() {
        return earlyLeaveAndLateArrivalCount;
    }

    public void setEarlyLeaveAndLateArrivalCount(Integer earlyLeaveAndLateArrivalCount) {
        this.earlyLeaveAndLateArrivalCount = earlyLeaveAndLateArrivalCount;
    }

    public Integer getLeaveDays() {
        return leaveDays;
    }

    public void setLeaveDays(Integer leaveDays) {
        this.leaveDays = leaveDays;
    }

    @Override
    public String toString() {
        return "AttendanceRecord{" +
                "normalSignInCount=" + normalSignInCount +
                ", earlyLeaveAndLateArrivalCount=" + earlyLeaveAndLateArrivalCount +
                ", leaveDays=" + leaveDays +
                '}';
    }

}
