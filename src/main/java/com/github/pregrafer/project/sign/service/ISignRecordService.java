package com.github.pregrafer.project.sign.service;

import java.util.List;

import com.github.pregrafer.framework.web.domain.AjaxResult;
import com.github.pregrafer.project.sign.domain.SignRecord;

/**
 * 考勤记录Service接口
 * 
 * @author lsj
 * @date 2024-07-01
 */
public interface ISignRecordService 
{
    /**
     * 查询考勤记录
     * 
     * @param recordId 考勤记录主键
     * @return 考勤记录
     */
    public SignRecord selectSignRecordByRecordId(Long recordId);

    /**
     * 查询考勤记录列表
     * 
     * @param signRecord 考勤记录
     * @return 考勤记录集合
     */
    public List<SignRecord> selectSignRecordList(SignRecord signRecord);

    /**
     * 新增考勤记录
     * 
     * @param signRecord 考勤记录
     * @return 结果
     */
    public int insertSignRecord(SignRecord signRecord);
    /**
     * 新增签到/退记录
     *
     *
     *
     */
    public AjaxResult insertcheckRecord(SignRecord signRecord);
    /**
     * 修改考勤记录
     * 
     * @param signRecord 考勤记录
     * @return 结果
     */
    public int updateSignRecord(SignRecord signRecord);

    /**
     * 批量删除考勤记录
     * 
     * @param recordIds 需要删除的考勤记录主键集合
     * @return 结果
     */
    public int deleteSignRecordByRecordIds(Long[] recordIds);

    /**
     * 删除考勤记录信息
     * 
     * @param recordId 考勤记录主键
     * @return 结果
     */
    public int deleteSignRecordByRecordId(Long recordId);
}
