package com.github.pregrafer.project.field.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.github.pregrafer.framework.aspectj.lang.annotation.Excel;
import com.github.pregrafer.framework.web.domain.BaseEntity;

/**
 * 收获信息对象 harvestrecords
 * 
 *
 * @date 2024-06-30
 */
public class Harvestrecords extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 收获记录id */
    private Long harvestId;

    /** 作物id */
    @Excel(name = "作物id")
    private Long cropId;

    /** 农田id */
    @Excel(name = "农田id")
    private Long fieldId;

    /** 收获时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "收获时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date harvestDate;

    /** 收获数量 */
    @Excel(name = "收获数量")
    private Long harvestAmount;

    public void setHarvestId(Long harvestId) 
    {
        this.harvestId = harvestId;
    }

    public Long getHarvestId() 
    {
        return harvestId;
    }
    public void setCropId(Long cropId) 
    {
        this.cropId = cropId;
    }

    public Long getCropId() 
    {
        return cropId;
    }
    public void setFieldId(Long fieldId) 
    {
        this.fieldId = fieldId;
    }

    public Long getFieldId() 
    {
        return fieldId;
    }
    public void setHarvestDate(Date harvestDate) 
    {
        this.harvestDate = harvestDate;
    }

    public Date getHarvestDate() 
    {
        return harvestDate;
    }
    public void setHarvestAmount(Long harvestAmount) 
    {
        this.harvestAmount = harvestAmount;
    }

    public Long getHarvestAmount() 
    {
        return harvestAmount;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("harvestId", getHarvestId())
            .append("cropId", getCropId())
            .append("fieldId", getFieldId())
            .append("harvestDate", getHarvestDate())
            .append("harvestAmount", getHarvestAmount())
            .toString();
    }
}
