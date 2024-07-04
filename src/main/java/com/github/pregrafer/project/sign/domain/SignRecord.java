package com.github.pregrafer.project.sign.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.github.pregrafer.framework.aspectj.lang.annotation.Excel;
import com.github.pregrafer.framework.web.domain.BaseEntity;

/**
 * 考勤记录对象 sign_record
 * 
 * @author lsj
 * @date 2024-07-01
 */
public class SignRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 考勤记录编号 */
    private Long recordId;

    /** 部门编号 */
    @Excel(name = "部门编号")
    private Long deptId;

    /** 员工编号 */
    @Excel(name = "员工编号")
    private Long userId;

    /** 时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date signTime;

    /** 考勤状态 */
    @Excel(name = "考勤状态")
    private String signState;

    /** 考勤种类 */
    @Excel(name = "考勤种类")
    private String signType;

    @Excel(name = "更新时间")
    private Date updateTime;

    public void setRecordId(Long recordId) 
    {
        this.recordId = recordId;
    }
    public SignRecord(Long deptId,Long userId,String signType) {
        this.deptId = deptId;
        this.userId = userId;
        this.signType = signType;
    }

    public Long getRecordId() 
    {
        return recordId;
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


    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setSignTime(Date signTime) 
    {
        this.signTime = signTime;
    }

    public Date getSignTime() 
    {
        return signTime;
    }
    public void setSignState(String signState) 
    {
        this.signState = signState;
    }

    public String getSignState() 
    {
        return signState;
    }
    public void setSignType(String signType) 
    {
        this.signType = signType;
    }

    public String getSignType() 
    {
        return signType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recordId", getRecordId())
            .append("deptId", getDeptId())
            .append("userId", getUserId())
            .append("signTime", getSignTime())
            .append("signState", getSignState())
            .append("signType", getSignType())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
