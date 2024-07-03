package com.ruoyi.project.sign.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ruoyi.project.sign.domain.AttendanceRecord;
import com.ruoyi.project.sign.domain.SignRecord;
import com.ruoyi.project.sign.mapper.SignRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.sign.mapper.LeaveRecordMapper;
import com.ruoyi.project.sign.domain.LeaveRecord;
import com.ruoyi.project.sign.service.ILeaveRecordService;

import java.util.Calendar;
import java.util.concurrent.TimeUnit;
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
    private SignRecordMapper signRecordMapper;
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

    @Override
    public int updateLeaveStateToThreeByLeaveID(Long leaveId) {
        LeaveRecord leaveRecord = new LeaveRecord();
        leaveRecord.setLeaveId(leaveId);
        leaveRecord.setLeaveState(3L);
        return leaveRecordMapper.updateLeaveRecord(leaveRecord);
    }

    @Override
    public List<LeaveRecord> selectLeaveRecordByDeptId(Long deptID) {
        return leaveRecordMapper.selectLeaveRecordByDeptIdAndLeaveState(deptID,0L);
    }



    @Override
    public int updateLeaveStateAndReply(Long leaveId,  Long leaveState,  String reply) {
        LeaveRecord leaveRecord = new LeaveRecord();
        leaveRecord.setLeaveId(leaveId);
        leaveRecord.setLeaveState(leaveState);
        leaveRecord.setReply(reply);
        return leaveRecordMapper.updateLeaveRecord(leaveRecord);
    }



    @Override
    public LeaveRecord selectLeaveRecordByUserIdAndLeaveState(Long userID) {
        return leaveRecordMapper.selectLeaveRecordByUserIdAndLeaveState(userID);
    }

    @Override
    public AttendanceRecord selectLeaveRecordByUserIdByMonth(Long userID) {
        List<LeaveRecord> leaveRecords=new ArrayList<LeaveRecord>();
        leaveRecords=leaveRecordMapper.selectLeaveRecordByUserId(userID,1L);
        Date currentDate = new Date();
        int allLeaveTime = calculateTotalLeaveTime(leaveRecords, currentDate);
        List<SignRecord> signRecords=new ArrayList<SignRecord>();
        signRecords=signRecordMapper.selectSignRecordByUserId(userID);
        currentDate = new Date();
        Calendar currentCalendar = Calendar.getInstance();
        currentCalendar.setTime(currentDate);
        int currentYear = currentCalendar.get(Calendar.YEAR);
        int currentMonth = currentCalendar.get(Calendar.MONTH);
        // 初始化计数器
        int normalSignInCount = 0;
        int earlyLeaveAndLateArrivalCount = 0;

        // 遍历 signRecords 计算计数
        for (SignRecord record : signRecords) {
            Calendar signCalendar = Calendar.getInstance();
            signCalendar.setTime(record.getSignTime());
            int signYear = signCalendar.get(Calendar.YEAR);
            int signMonth = signCalendar.get(Calendar.MONTH);

            // 判断 signTime 是否为当前月
            if (signYear == currentYear && signMonth == currentMonth) {
                if ("1".equals(record.getSignState())) {
                    earlyLeaveAndLateArrivalCount++;
                } else if ("0".equals(record.getSignState())) {
                    normalSignInCount++;
                }
            }
        }
        AttendanceRecord attendanceRecord=new AttendanceRecord();
        attendanceRecord.setLeaveDays(allLeaveTime);
        attendanceRecord.setEarlyLeaveAndLateArrivalCount(earlyLeaveAndLateArrivalCount);
        attendanceRecord.setNormalSignInCount(normalSignInCount);
        return attendanceRecord;
    }

    @Override
    public AttendanceRecord selectLeaveRecordByDeptIdByMonth(Long deptID) {
        List<LeaveRecord> leaveRecords=new ArrayList<LeaveRecord>();
        leaveRecords=leaveRecordMapper.selectLeaveRecordByDeptId(deptID,1L);
        Date currentDate = new Date();
        int allLeaveTime = calculateTotalLeaveTime(leaveRecords, currentDate);
        List<SignRecord> signRecords=new ArrayList<SignRecord>();
        signRecords=signRecordMapper.selectSignRecordByDeptId(deptID);
        currentDate = new Date();
        Calendar currentCalendar = Calendar.getInstance();
        currentCalendar.setTime(currentDate);
        int currentYear = currentCalendar.get(Calendar.YEAR);
        int currentMonth = currentCalendar.get(Calendar.MONTH);
        // 初始化计数器
        int normalSignInCount = 0;
        int earlyLeaveAndLateArrivalCount = 0;

        // 遍历 signRecords 计算计数
        for (SignRecord record : signRecords) {
            Calendar signCalendar = Calendar.getInstance();
            signCalendar.setTime(record.getSignTime());
            int signYear = signCalendar.get(Calendar.YEAR);
            int signMonth = signCalendar.get(Calendar.MONTH);

            // 判断 signTime 是否为当前月
            if (signYear == currentYear && signMonth == currentMonth) {
                if ("1".equals(record.getSignState())) {
                    earlyLeaveAndLateArrivalCount++;
                } else if ("0".equals(record.getSignState())) {
                    normalSignInCount++;
                }
            }
        }
        AttendanceRecord attendanceRecord=new AttendanceRecord();
        attendanceRecord.setLeaveDays(allLeaveTime);
        attendanceRecord.setEarlyLeaveAndLateArrivalCount(earlyLeaveAndLateArrivalCount);
        attendanceRecord.setNormalSignInCount(normalSignInCount);
        return attendanceRecord;
    }

    public int calculateTotalLeaveTime(List<LeaveRecord> leaveRecords, Date currentDate) {
        int totalLeaveTime = 0;

        // 获取系统时间的年和月
        Calendar currentCalendar = Calendar.getInstance();
        currentCalendar.setTime(currentDate);
        int currentYear = currentCalendar.get(Calendar.YEAR);
        int currentMonth = currentCalendar.get(Calendar.MONTH);

        for (LeaveRecord record : leaveRecords) {
            Calendar startCalendar = Calendar.getInstance();
            startCalendar.setTime(record.getLeaveStartTime());
            int startYear = startCalendar.get(Calendar.YEAR);
            int startMonth = startCalendar.get(Calendar.MONTH);

            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(record.getLeaveEndTime());
            int endYear = endCalendar.get(Calendar.YEAR);
            int endMonth = endCalendar.get(Calendar.MONTH);

            if (startYear == currentYear && startMonth == currentMonth && endYear == currentYear && endMonth == currentMonth) {
                // leaveStartTime与系统时间同月，leaveEndTime与系统时间同月
                totalLeaveTime += calculateDaysBetween(record.getLeaveStartTime(), record.getLeaveEndTime());
            } else if (startYear == currentYear && startMonth == currentMonth && endYear == currentYear && endMonth != currentMonth) {
                // leaveStartTime与系统时间同月，leaveEndTime与系统时间不同月
                totalLeaveTime += calculateDaysBetween(record.getLeaveStartTime(), getEndOfMonth(currentDate));
            } else if (startYear == currentYear && startMonth != currentMonth && endYear == currentYear && endMonth == currentMonth) {
                // leaveStartTime与系统时间不同月，leaveEndTime与系统时间同月
                totalLeaveTime += calculateDaysBetween(getStartOfMonth(currentDate), record.getLeaveEndTime());
            }
        }

        return totalLeaveTime;
    }

    // 计算两个日期之间的天数
    public int calculateDaysBetween(Date startDate, Date endDate) {
        long diffInMillis = endDate.getTime() - startDate.getTime();
        return (int) TimeUnit.DAYS.convert(diffInMillis, TimeUnit.MILLISECONDS);
    }

    // 获取指定日期所在月的月初
    public Date getStartOfMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        return calendar.getTime();
    }

    // 获取指定日期所在月的月底
    public Date getEndOfMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        return calendar.getTime();
    }
}
