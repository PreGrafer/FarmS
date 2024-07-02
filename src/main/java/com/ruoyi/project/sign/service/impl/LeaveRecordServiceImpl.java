package com.ruoyi.project.sign.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.sign.mapper.LeaveRecordMapper;
import com.ruoyi.project.sign.domain.LeaveRecord;
import com.ruoyi.project.sign.service.ILeaveRecordService;

/**
 * 请假记录Service业务层处理
 * 
 * @author lsj
 * @date 2024-07-02
 */
@Service
public class LeaveRecordServiceImpl implements ILeaveRecordService 
{
    @Autowired
    private LeaveRecordMapper leaveRecordMapper;

    /**
     * 查询请假记录
     * 
     * @param leaveId 请假记录主键
     * @return 请假记录
     */
    @Override
    public LeaveRecord selectLeaveRecordByLeaveId(Long leaveId)
    {
        return leaveRecordMapper.selectLeaveRecordByLeaveId(leaveId);
    }

    /**
     * 查询请假记录列表
     * 
     * @param leaveRecord 请假记录
     * @return 请假记录
     */
    @Override
    public List<LeaveRecord> selectLeaveRecordList(LeaveRecord leaveRecord)
    {
        return leaveRecordMapper.selectLeaveRecordList(leaveRecord);
    }

    /**
     * 新增请假记录
     * 
     * @param leaveRecord 请假记录
     * @return 结果
     */
    @Override
    public int insertLeaveRecord(LeaveRecord leaveRecord)
    {
        return leaveRecordMapper.insertLeaveRecord(leaveRecord);
    }

    /**
     * 修改请假记录
     * 
     * @param leaveRecord 请假记录
     * @return 结果
     */
    @Override
    public int updateLeaveRecord(LeaveRecord leaveRecord)
    {
        return leaveRecordMapper.updateLeaveRecord(leaveRecord);
    }

    /**
     * 批量删除请假记录
     * 
     * @param leaveIds 需要删除的请假记录主键
     * @return 结果
     */
    @Override
    public int deleteLeaveRecordByLeaveIds(Long[] leaveIds)
    {
        return leaveRecordMapper.deleteLeaveRecordByLeaveIds(leaveIds);
    }

    /**
     * 删除请假记录信息
     * 
     * @param leaveId 请假记录主键
     * @return 结果
     */
    @Override
    public int deleteLeaveRecordByLeaveId(Long leaveId)
    {
        return leaveRecordMapper.deleteLeaveRecordByLeaveId(leaveId);
    }
}
