package com.ruoyi.project.sign.mapper;

import java.util.List;
import com.ruoyi.project.sign.domain.SignRecord;

/**
 * 考勤记录Mapper接口
 * 
 * @author lsj
 * @date 2024-07-01
 */
public interface SignRecordMapper 
{
    /**
     * 查询考勤记录
     * 
     * @param recordId 考勤记录主键
     * @return 考勤记录
     */
    public SignRecord selectSignRecordByRecordId(Long recordId);

    /**
     * 查询考勤记录
     *
     * @param userID
     * @return 考勤记录
     */
    public List<SignRecord> selectSignRecordByUserId(Long userID);

    public List<SignRecord> selectSignRecordByDeptId(Long deptID);
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
     * 修改考勤记录
     * 
     * @param signRecord 考勤记录
     * @return 结果
     */
    public int updateSignRecord(SignRecord signRecord);

    /**
     * 删除考勤记录
     * 
     * @param recordId 考勤记录主键
     * @return 结果
     */
    public int deleteSignRecordByRecordId(Long recordId);

    /**
     * 批量删除考勤记录
     * 
     * @param recordIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSignRecordByRecordIds(Long[] recordIds);
}
