package com.ruoyi.project.sign.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 请假记录对象 leave_record
 * 
 * @author lsj
 * @date 2024-07-02
 */
public class LeaveRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录编号 */
    private Long leaveId;

    /** 部门编号 */
    @Excel(name = "部门编号")
    private Long deptId;

    /** 员工编号 */
    @Excel(name = "员工编号")
    private Long userId;

    /** 申请时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "申请时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date haninTime;

    /** 假期开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "假期开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date leaveStartTime;

    /** 假期结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "假期结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date leaveEndTime;

    /** 申请状态 */
    @Excel(name = "申请状态")
    private Long leaveState;

    /** 请假事由 */
    @Excel(name = "请假事由")
    private String reason;

    /** 审批片语 */
    @Excel(name = "审批片语")
    private String reply;

    public void setLeaveId(Long leaveId) 
    {
        this.leaveId = leaveId;
    }

    public Long getLeaveId() 
    {
        return leaveId;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setHaninTime(Date haninTime) 
    {
        this.haninTime = haninTime;
    }

    public Date getHaninTime() 
    {
        return haninTime;
    }
    public void setLeaveStartTime(Date leaveStartTime) 
    {
        this.leaveStartTime = leaveStartTime;
    }

    public Date getLeaveStartTime() 
    {
        return leaveStartTime;
    }
    public void setLeaveEndTime(Date leaveEndTime) 
    {
        this.leaveEndTime = leaveEndTime;
    }

    public Date getLeaveEndTime() 
    {
        return leaveEndTime;
    }
    public void setLeaveState(Long leaveState) 
    {
        this.leaveState = leaveState;
    }

    public Long getLeaveState() 
    {
        return leaveState;
    }
    public void setReason(String reason) 
    {
        this.reason = reason;
    }

    public String getReason() 
    {
        return reason;
    }
    public void setReply(String reply) 
    {
        this.reply = reply;
    }

    public String getReply() 
    {
        return reply;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("leaveId", getLeaveId())
            .append("deptId", getDeptId())
            .append("userId", getUserId())
            .append("haninTime", getHaninTime())
            .append("leaveStartTime", getLeaveStartTime())
            .append("leaveEndTime", getLeaveEndTime())
            .append("leaveState", getLeaveState())
            .append("reason", getReason())
            .append("reply", getReply())
            .toString();
    }
}
