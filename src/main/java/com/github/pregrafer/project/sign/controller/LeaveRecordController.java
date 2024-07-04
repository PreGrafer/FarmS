package com.github.pregrafer.project.sign.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.github.pregrafer.framework.aspectj.lang.annotation.Log;
import com.github.pregrafer.framework.aspectj.lang.enums.BusinessType;
import com.github.pregrafer.project.sign.domain.LeaveRecord;
import com.github.pregrafer.project.sign.service.ILeaveRecordService;
import com.github.pregrafer.framework.web.controller.BaseController;
import com.github.pregrafer.framework.web.domain.AjaxResult;
import com.github.pregrafer.common.utils.poi.ExcelUtil;
import com.github.pregrafer.framework.web.page.TableDataInfo;

/**
 * 请假记录Controller
 * 
 * @author lsj
 * @date 2024-07-02
 */
@RestController
@RequestMapping("/sign/leave")
public class LeaveRecordController extends BaseController
{
    @Autowired
    private ILeaveRecordService leaveRecordService;

    /**
     * 查询请假记录列表
     */
    @PreAuthorize("@ss.hasPermi('sign:leave:list')")
    @GetMapping("/list")
    public TableDataInfo list(LeaveRecord leaveRecord)
    {
        startPage();
        List<LeaveRecord> list = leaveRecordService.selectLeaveRecordList(leaveRecord);
        return getDataTable(list);
    }

    /**
     * 导出请假记录列表
     */
    @PreAuthorize("@ss.hasPermi('sign:leave:export')")
    @Log(title = "请假记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LeaveRecord leaveRecord)
    {
        List<LeaveRecord> list = leaveRecordService.selectLeaveRecordList(leaveRecord);
        ExcelUtil<LeaveRecord> util = new ExcelUtil<LeaveRecord>(LeaveRecord.class);
        util.exportExcel(response, list, "请假记录数据");
    }

    /**
     * 获取请假记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('sign:leave:query')")
    @GetMapping(value = "/info/{leaveId}")
    public AjaxResult getInfo(@PathVariable("leaveId") Long leaveId)
    {
        return success(leaveRecordService.selectLeaveRecordByLeaveId(leaveId));
    }

    /**
     * 新增请假记录
     */
    @PreAuthorize("@ss.hasPermi('sign:leave:add')")
    @Log(title = "请假记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LeaveRecord leaveRecord)
    {
        return toAjax(leaveRecordService.insertLeaveRecord(leaveRecord));
    }

    /**
     * 新增请假记录
     *  上传部门id 个人id 请假理由 请假时间 2024-07-11 2024-07-18
     *
     *
     */
    @PreAuthorize("@ss.hasPermi('sign:leave:holi')")
    @Log(title = "请假记录", businessType = BusinessType.INSERT)
    @PostMapping("/leaveApply")
    public AjaxResult leaveApply(@RequestParam Long deptId ,@RequestParam Long userId,@RequestParam String reason,@RequestParam String leaveBegin,@RequestParam String leaveEnd)
    {
        LeaveRecord leaveRecord=new LeaveRecord();
        leaveRecord.setLeaveState(0L);
        leaveRecord.setDeptId(deptId);
        leaveRecord.setUserId(userId);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try{
            leaveRecord.setLeaveStartTime(dateFormat.parse(leaveBegin));
            leaveRecord.setLeaveEndTime(dateFormat.parse(leaveEnd));
        }catch (Exception e){
            e.printStackTrace();
        }
        leaveRecord.setReason(reason);
        Date date=new Date();
        leaveRecord.setHaninTime(date);
        return toAjax(leaveRecordService.insertLeaveRecord(leaveRecord));
    }



    /**
     * 修改请假记录
     */
    @PreAuthorize("@ss.hasPermi('sign:leave:edit')")
    @Log(title = "请假记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LeaveRecord leaveRecord)
    {
        return toAjax(leaveRecordService.updateLeaveRecord(leaveRecord));
    }

    /**
     * 删除请假记录
     */
    @PreAuthorize("@ss.hasPermi('sign:leave:remove')")
    @Log(title = "请假记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{leaveIds}")
    public AjaxResult remove(@PathVariable Long[] leaveIds)
    {
        return toAjax(leaveRecordService.deleteLeaveRecordByLeaveIds(leaveIds));
    }

    /**
     * 上传leave_id 修改申请状态为3
     */
    @PreAuthorize("@ss.hasPermi('sign:leave:holi')")
    @Log(title = "请假记录", businessType = BusinessType.UPDATE)
    @PostMapping("/cancelLeave")
    public AjaxResult updateLeaveStateToThreeByLeaveID(@RequestParam Long leaveId)
    {
        return toAjax(leaveRecordService.updateLeaveStateToThreeByLeaveID(leaveId));
    }

    /**
     * 上传部门id，返回该部门已申请的请假列表
     */
    @GetMapping(value = "/list/{deptId}")
    public TableDataInfo getByDeptID(@PathVariable Long deptId)
    {
        List<LeaveRecord> list = leaveRecordService.selectLeaveRecordByDeptId(deptId);
        return getDataTable(list);
    }

    /**
     * 上传leave_id 修改申请状态,修改reply
     */
    @Log(title = "请假记录", businessType = BusinessType.UPDATE)
    @PostMapping("/updateState")
    public AjaxResult updateLeaveStateToThreeByLeaveID(@RequestParam Long leaveId,@RequestParam Long leaveState,@RequestParam String reply)
    {
        return toAjax(leaveRecordService.updateLeaveStateAndReply(leaveId,leaveState,reply));
    }

    /**
     * 上传userid，返回最新的的请假记录
     */
    @GetMapping(value = "/userLastLeave/{userId}")
    public AjaxResult getByuserID(@PathVariable Long userId)
    {
        return success(leaveRecordService.selectLeaveRecordByUserIdAndLeaveState(userId));
    }
    /**
     *
     * 上传一个部门id 返回正常签到次数，早退迟到次数，请假天数
     */
    @GetMapping(value = "/month/{deptId}")
    public AjaxResult getMonthByDeptID(@PathVariable Long deptId)
    {
        return success(leaveRecordService.selectLeaveRecordByDeptIdByMonth(deptId));
    }

    /**
     *
     * 上传一个userid 返回正常签到次数，早退迟到次数，请假天数
     */
    @GetMapping(value = "/month/{userId}")
    public AjaxResult getMonthByUserID(@PathVariable Long userId)
    {
        return success(leaveRecordService.selectLeaveRecordByUserIdByMonth(userId));
    }
}
