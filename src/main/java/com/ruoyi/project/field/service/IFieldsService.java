package com.ruoyi.project.field.service;

import java.util.List;
import com.ruoyi.project.field.domain.Fields;

/**
 * 农田信息Service接口
 * 
 * @author ruoyi
 * @date 2024-06-30
 */
public interface IFieldsService 
{
    /**
     * 查询农田信息
     * 
     * @param fieldId 农田信息主键
     * @return 农田信息
     */
    public Fields selectFieldsByFieldId(Long fieldId);

    /**
     * 查询农田信息列表
     * 
     * @param fields 农田信息
     * @return 农田信息集合
     */
    public List<Fields> selectFieldsList(Fields fields);

    /**
     * 新增农田信息
     * 
     * @param fields 农田信息
     * @return 结果
     */
    public int insertFields(Fields fields);

    /**
     * 修改农田信息
     * 
     * @param fields 农田信息
     * @return 结果
     */
    public int updateFields(Fields fields);

    /**
     * 批量删除农田信息
     * 
     * @param fieldIds 需要删除的农田信息主键集合
     * @return 结果
     */
    public int deleteFieldsByFieldIds(Long[] fieldIds);

    /**
     * 删除农田信息信息
     * 
     * @param fieldId 农田信息主键
     * @return 结果
     */
    public int deleteFieldsByFieldId(Long fieldId);

    public String importFields(List<Fields> fieldsList, String operName);
}
