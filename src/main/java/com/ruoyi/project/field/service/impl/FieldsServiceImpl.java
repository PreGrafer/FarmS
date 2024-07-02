package com.ruoyi.project.field.service.impl;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.project.system.domain.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.field.mapper.FieldsMapper;
import com.ruoyi.project.field.domain.Fields;
import com.ruoyi.project.field.service.IFieldsService;

import javax.validation.Validator;

/**
 * 农田信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-06-30
 */
@Service
public class FieldsServiceImpl implements IFieldsService 
{
    @Autowired
    private FieldsMapper fieldsMapper;

    @Autowired
    protected Validator validator;

    /**
     * 查询农田信息
     * 
     * @param fieldId 农田信息主键
     * @return 农田信息
     */
    @Override
    public Fields selectFieldsByFieldId(Long fieldId)
    {
        return fieldsMapper.selectFieldsByFieldId(fieldId);
    }

    /**
     * 查询农田信息列表
     * 
     * @param fields 农田信息
     * @return 农田信息
     */
    @Override
    public List<Fields> selectFieldsList(Fields fields)
    {
        return fieldsMapper.selectFieldsList(fields);
    }

    /**
     * 新增农田信息
     * 
     * @param fields 农田信息
     * @return 结果
     */
    @Override
    public int insertFields(Fields fields)
    {
        return fieldsMapper.insertFields(fields);
    }

    /**
     * 修改农田信息
     * 
     * @param fields 农田信息
     * @return 结果
     */
    @Override
    public int updateFields(Fields fields)
    {
        return fieldsMapper.updateFields(fields);
    }

    /**
     * 批量删除农田信息
     * 
     * @param fieldIds 需要删除的农田信息主键
     * @return 结果
     */
    @Override
    public int deleteFieldsByFieldIds(Long[] fieldIds)
    {
        return fieldsMapper.deleteFieldsByFieldIds(fieldIds);
    }

    /**
     * 删除农田信息信息
     * 
     * @param fieldId 农田信息主键
     * @return 结果
     */
    @Override
    public int deleteFieldsByFieldId(Long fieldId)
    {
        return fieldsMapper.deleteFieldsByFieldId(fieldId);
    }

/**
 * 导入农田数据
 *
 * @param fieldsList      农田数据列表
 * @param operName        操作用户
 * @return 结果
 */
    @Override
    public String importFields(List<Fields> fieldsList, String operName)
    {
        if (StringUtils.isNull(fieldsList) || fieldsList.size() == 0)
        {
            throw new ServiceException("导入农田数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (Fields field : fieldsList)
        {
            try
            {
                BeanValidators.validateWithException(validator, field);
                field.setCreateBy(operName);
                fieldsMapper.insertFields(field);
                successNum++;
                successMsg.append("<br/>" + successNum + "、农田导入成功");
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、农田导入失败：";
                failureMsg.append(msg + e.getMessage());
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }
}
