package com.ruoyi.project.sign.mapper;

import java.util.List;
import com.ruoyi.project.sign.domain.LeaveRecord;

/**
 * 请假记录Mapper接口
 * 
 * @author lsj
 * @date 2024-07-02
 */
public interface LeaveRecordMapper 
{
    /**
     * 查询请假记录
     * 
     * @param leaveId 请假记录主键
     * @return 请假记录
     */
    public LeaveRecord selectLeaveRecordByLeaveId(Long leaveId);

    /**
     * 查询请假记录列表
     * 
     * @param leaveRecord 请假记录
     * @return 请假记录集合
     */
    public List<LeaveRecord> selectLeaveRecordList(LeaveRecord leaveRecord);

    /**
     * 新增请假记录
     * 
     * @param leaveRecord 请假记录
     * @return 结果
     */
    public int insertLeaveRecord(LeaveRecord leaveRecord);

    /**
     * 修改请假记录
     * 
     * @param leaveRecord 请假记录
     * @return 结果
     */
    public int updateLeaveRecord(LeaveRecord leaveRecord);

    /**
     * 删除请假记录
     * 
     * @param leaveId 请假记录主键
     * @return 结果
     */
    public int deleteLeaveRecordByLeaveId(Long leaveId);

    /**
     * 批量删除请假记录
     * 
     * @param leaveIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLeaveRecordByLeaveIds(Long[] leaveIds);
}
