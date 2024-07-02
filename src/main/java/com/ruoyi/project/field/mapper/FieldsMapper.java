package com.ruoyi.project.field.mapper;

import java.util.List;
import com.ruoyi.project.field.domain.Fields;

/**
 * 农田信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-06-30
 */
public interface FieldsMapper 
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
     * 删除农田信息
     * 
     * @param fieldId 农田信息主键
     * @return 结果
     */
    public int deleteFieldsByFieldId(Long fieldId);

    /**
     * 批量删除农田信息
     * 
     * @param fieldIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFieldsByFieldIds(Long[] fieldIds);
}
