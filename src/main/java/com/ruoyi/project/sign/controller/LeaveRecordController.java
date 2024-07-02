package com.ruoyi.project.sign.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.sign.domain.LeaveRecord;
import com.ruoyi.project.sign.service.ILeaveRecordService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

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
    @GetMapping(value = "/{leaveId}")
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
}
