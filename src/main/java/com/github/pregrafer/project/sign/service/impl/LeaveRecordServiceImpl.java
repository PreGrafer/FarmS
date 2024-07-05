package com.github.pregrafer.project.sign.service.impl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.github.pregrafer.project.sign.domain.AttendanceRecord;
import com.github.pregrafer.project.sign.domain.SignRecord;
import com.github.pregrafer.project.sign.mapper.SignRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pregrafer.project.sign.mapper.LeaveRecordMapper;
import com.github.pregrafer.project.sign.domain.LeaveRecord;
import com.github.pregrafer.project.sign.service.ILeaveRecordService;

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

    @Autowired
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
    LocalDate currentDate = LocalDate.now();
    LocalDate lastMonthDate = currentDate.minusMonths(1);
    return generateAttendanceRecord(
        leaveRecordMapper.selectLeaveRecordByUserId(userID, 1L),
        signRecordMapper.selectSignRecordByUserId(userID),
        currentDate,
        lastMonthDate
    );
}

@Override
public AttendanceRecord selectLeaveRecordByDeptIdByMonth(Long deptID) {
    LocalDate currentDate = LocalDate.now();
    LocalDate lastMonthDate = currentDate.minusMonths(1);
    return generateAttendanceRecord(
        leaveRecordMapper.selectLeaveRecordByDeptId(deptID, 1L),
        signRecordMapper.selectSignRecordByDeptId(deptID),
        currentDate,
        lastMonthDate
    );
}

private AttendanceRecord generateAttendanceRecord(List<LeaveRecord> leaveRecords, List<SignRecord> signRecords, LocalDate currentDate, LocalDate lastMonthDate) {
    int allLeaveTimeCurrentMonth = calculateTotalLeaveTime(leaveRecords, currentDate);
    int allLeaveTimeLastMonth = calculateTotalLeaveTime(leaveRecords, lastMonthDate);

    int normalSignInCountCurrentMonth = 0;
    int earlyLeaveAndLateArrivalCountCurrentMonth = 0;
    int normalSignInCountLastMonth = 0;
    int earlyLeaveAndLateArrivalCountLastMonth = 0;

    for (SignRecord record : signRecords) {
        LocalDateTime signTime = record.getSignTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
        if (signTime.getYear() == currentDate.getYear() && signTime.getMonthValue() == currentDate.getMonthValue()) {
            if ("1".equals(record.getSignState())) {
                earlyLeaveAndLateArrivalCountCurrentMonth++;
            } else if ("0".equals(record.getSignState())) {
                normalSignInCountCurrentMonth++;
            }
        }
        if (signTime.getYear() == lastMonthDate.getYear() && signTime.getMonthValue() == lastMonthDate.getMonthValue()) {
            if ("1".equals(record.getSignState())) {
                earlyLeaveAndLateArrivalCountLastMonth++;
            } else if ("0".equals(record.getSignState())) {
                normalSignInCountLastMonth++;
            }
        }
    }

    AttendanceRecord attendanceRecord = new AttendanceRecord();
    attendanceRecord.setLeaveDays(allLeaveTimeCurrentMonth);
    attendanceRecord.setEarlyLeaveAndLateArrivalCount(earlyLeaveAndLateArrivalCountCurrentMonth);
    attendanceRecord.setNormalSignInCount(normalSignInCountCurrentMonth);
    attendanceRecord.setLastLeaveDays(allLeaveTimeLastMonth);
    attendanceRecord.setLastEarlyLeaveAndLateArrivalCount(earlyLeaveAndLateArrivalCountLastMonth);
    attendanceRecord.setLastNormalSignInCount(normalSignInCountLastMonth);
    return attendanceRecord;
}

public int calculateTotalLeaveTime(List<LeaveRecord> leaveRecords, LocalDate date) {
    int totalLeaveTime = 0;

    for (LeaveRecord record : leaveRecords) {
        LocalDate start = record.getLeaveStartTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate end = record.getLeaveEndTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        if (start.getYear() == date.getYear() && start.getMonthValue() == date.getMonthValue() &&
            end.getYear() == date.getYear() && end.getMonthValue() == date.getMonthValue()) {
            totalLeaveTime += calculateDaysBetween(start, end);
        } else if (start.getYear() == date.getYear() && start.getMonthValue() == date.getMonthValue()) {
            totalLeaveTime += calculateDaysBetween(start, date.withDayOfMonth(date.lengthOfMonth()));
        } else if (end.getYear() == date.getYear() && end.getMonthValue() == date.getMonthValue()) {
            totalLeaveTime += calculateDaysBetween(date.withDayOfMonth(1), end);
        }
    }

    return totalLeaveTime;
}

public int calculateDaysBetween(LocalDate startDate, LocalDate endDate) {
    return Period.between(startDate, endDate).getDays();
}

}
