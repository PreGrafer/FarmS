package com.ruoyi.project.sign.service.impl;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.web.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.sign.mapper.SignRecordMapper;
import com.ruoyi.project.sign.domain.SignRecord;
import com.ruoyi.project.sign.service.ISignRecordService;

/**
 * 考勤记录Service业务层处理
 * 
 * @author lsj
 * @date 2024-07-01
 */
@Service
public class SignRecordServiceImpl implements ISignRecordService 
{
    @Autowired
    private SignRecordMapper signRecordMapper;

    /**
     * 查询考勤记录
     * 
     * @param recordId 考勤记录主键
     * @return 考勤记录
     */
    @Override
    public SignRecord selectSignRecordByRecordId(Long recordId)
    {
        return signRecordMapper.selectSignRecordByRecordId(recordId);
    }

    /**
     * 查询考勤记录列表
     * 
     * @param signRecord 考勤记录
     * @return 考勤记录
     */
    @Override
    public List<SignRecord> selectSignRecordList(SignRecord signRecord)
    {
        return signRecordMapper.selectSignRecordList(signRecord);
    }

    /**
     * 新增考勤记录
     * 
     * @param signRecord 考勤记录
     * @return 结果
     */
    @Override
    public int insertSignRecord(SignRecord signRecord)
    {
        return signRecordMapper.insertSignRecord(signRecord);
    }

    @Override
    public AjaxResult insertcheckRecord(SignRecord signRecord) {
        AjaxResult result = AjaxResult.error("签到失败,请联系管理员!");
        // 获取员工ID
        Long employeeId = signRecord.getUserId();
        // 获取系统当前日期和时间
        LocalDateTime currentDateTime = LocalDateTime.now();
        Date currentDate = Date.from(currentDateTime.atZone(ZoneId.systemDefault()).toInstant());
        signRecord.setSignTime(currentDate);

        // 查询该员工的签到记录
        List<SignRecord> signRecords = signRecordMapper.selectSignRecordByUserId(employeeId);

        // 检查是否有签到记录的日期是今天
        boolean hasSignedInToday = signRecords.stream()
                .anyMatch(record -> isSameDay(record.getSignTime(), currentDate)
                        && record.getSignType().equals(signRecord.getSignType()));

        // 如果没有签到记录是今天的，则插入新的记录
        if (!hasSignedInToday) {
            if ("in".equals(signRecord.getSignType())) {
                if (currentDateTime.toLocalTime().isAfter(LocalTime.of(8, 0))) {
                    signRecord.setSignState("1");
                    result = AjaxResult.warn("您迟到了!");
                } else {
                    signRecord.setSignState("0");
                    result = AjaxResult.success("签到成功!");
                }
            } else if ("out".equals(signRecord.getSignType())) {
                if (currentDateTime.toLocalTime().isBefore(LocalTime.of(17, 0))) {
                    signRecord.setSignState("1");
                    result = AjaxResult.warn("您早退了!");
                } else {
                    signRecord.setSignState("0");
                    result = AjaxResult.success("签退成功!");
                }
            }
            signRecord.setUpdateTime(currentDate);
            signRecordMapper.insertSignRecord(signRecord);
            return result;
        }else {
            result =AjaxResult.warn("您今天已经签到过了!");
            return result;
        }
    }

    private boolean isSameDay(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        return cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) &&
                cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);
    }


    /**
     * 修改考勤记录
     * 
     * @param signRecord 考勤记录
     * @return 结果
     */
    @Override
    public int updateSignRecord(SignRecord signRecord)
    {
        signRecord.setUpdateTime(DateUtils.getNowDate());
        return signRecordMapper.updateSignRecord(signRecord);
    }

    /**
     * 批量删除考勤记录
     * 
     * @param recordIds 需要删除的考勤记录主键
     * @return 结果
     */
    @Override
    public int deleteSignRecordByRecordIds(Long[] recordIds)
    {
        return signRecordMapper.deleteSignRecordByRecordIds(recordIds);
    }

    /**
     * 删除考勤记录信息
     * 
     * @param recordId 考勤记录主键
     * @return 结果
     */
    @Override
    public int deleteSignRecordByRecordId(Long recordId)
    {
        return signRecordMapper.deleteSignRecordByRecordId(recordId);
    }
}
