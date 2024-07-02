package com.ruoyi.project.field.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 作物信息对象 crops
 * 
 * @author ruoyi
 * @date 2024-06-30
 */
public class Crops extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 作物id */
    @Excel(name = "作物id")
    private Long cropId;

    /** 作物名称 */
    @Excel(name = "作物名称")
    private String name;

    /** 生长周期/天 */
    @Excel(name = "生长周期/天")
    private Long growthCycle;

    /** 产量/亩 */
    @Excel(name = "产量/亩")
    private Long yield;

    public void setCropId(Long cropId) 
    {
        this.cropId = cropId;
    }

    public Long getCropId() 
    {
        return cropId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setGrowthCycle(Long growthCycle) 
    {
        this.growthCycle = growthCycle;
    }

    public Long getGrowthCycle() 
    {
        return growthCycle;
    }
    public void setYield(Long yield) 
    {
        this.yield = yield;
    }

    public Long getYield() 
    {
        return yield;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("cropId", getCropId())
            .append("name", getName())
            .append("growthCycle", getGrowthCycle())
            .append("yield", getYield())
            .toString();
    }
}
