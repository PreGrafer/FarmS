package com.github.pregrafer.project.field.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.github.pregrafer.framework.aspectj.lang.annotation.Excel;
import com.github.pregrafer.framework.web.domain.BaseEntity;

/**
 * 农田信息对象 fields
 * 
 *
 * @date 2024-06-30
 */
public class Fields extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 农田id */
    @Excel(name = "农田id", type = Excel.Type.EXPORT, cellType = Excel.ColumnType.NUMERIC, prompt = "农田编号")
    private Long fieldId;

    /** 面积/亩 */
    @Excel(name = "面积/亩")
    private Double area;

    /** 纬度 */
    @Excel(name = "纬度")
    private Double latitude;

    /** 经度 */
    @Excel(name = "经度")
    private Double longitude;

    /** 土壤类型 */
    @Excel(name = "土壤类型", readConverterExp = "0=砂土,1=黑土,2=红土,3=其他")
    private String soilType;

    /** 当前种植的作物id */
    @Excel(name = "当前种植的作物id")
    private Long currentCropId;

    public void setFieldId(Long fieldId) 
    {
        this.fieldId = fieldId;
    }

    public Long getFieldId() 
    {
        return fieldId;
    }
    public void setArea(Double area) 
    {
        this.area = area;
    }

    public Double getArea() 
    {
        return area;
    }
    public void setLatitude(Double latitude) 
    {
        this.latitude = latitude;
    }

    public Double getLatitude() 
    {
        return latitude;
    }
    public void setLongitude(Double longitude) 
    {
        this.longitude = longitude;
    }

    public Double getLongitude() 
    {
        return longitude;
    }
    public void setSoilType(String soilType) 
    {
        this.soilType = soilType;
    }

    public String getSoilType() 
    {
        return soilType;
    }
    public void setCurrentCropId(Long currentCropId) 
    {
        this.currentCropId = currentCropId;
    }

    public Long getCurrentCropId() 
    {
        return currentCropId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("fieldId", getFieldId())
            .append("area", getArea())
            .append("latitude", getLatitude())
            .append("longitude", getLongitude())
            .append("soilType", getSoilType())
            .append("currentCropId", getCurrentCropId())
            .toString();
    }
}
