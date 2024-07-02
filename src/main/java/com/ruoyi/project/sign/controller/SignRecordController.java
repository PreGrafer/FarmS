package com.ruoyi.project.sign.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.sign.domain.SignRecord;
import com.ruoyi.project.sign.service.ISignRecordService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 考勤记录Controller
 * 
 * @author lsj
 * @date 2024-07-01
 */
@RestController
@RequestMapping("/sign/record")
public class SignRecordController extends BaseController
{
    @Autowired
    private ISignRecordService signRecordService;

    /**
     * 查询考勤记录列表
     */
    @PreAuthorize("@ss.hasPermi('sign:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(SignRecord signRecord)
    {
        startPage();
        List<SignRecord> list = signRecordService.selectSignRecordList(signRecord);
        return getDataTable(list);
    }

    /**
     * 导出考勤记录列表
     */
    @PreAuthorize("@ss.hasPermi('sign:record:export')")
    @Log(title = "考勤记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SignRecord signRecord)
    {
        List<SignRecord> list = signRecordService.selectSignRecordList(signRecord);
        ExcelUtil<SignRecord> util = new ExcelUtil<SignRecord>(SignRecord.class);
        util.exportExcel(response, list, "考勤记录数据");
    }

    /**
     * 获取考勤记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('sign:record:query')")
    @GetMapping(value = "/{recordId}")
    public AjaxResult getInfo(@PathVariable("recordId") Long recordId)
    {
        return success(signRecordService.selectSignRecordByRecordId(recordId));
    }

    /**
     * 新增考勤记录
     */
    @PreAuthorize("@ss.hasPermi('sign:record:add')")
    @Log(title = "考勤记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SignRecord signRecord)
    {
        return toAjax(signRecordService.insertSignRecord(signRecord));
    }


    @PreAuthorize("@ss.hasPermi('sign:record:check')")
    @PostMapping("/check")
    public AjaxResult check(@RequestParam Long userId, @RequestParam Long deptId, @RequestParam String signType)
    {
        return signRecordService.insertcheckRecord(new SignRecord(deptId, userId, signType));
    }


    /**
     * 修改考勤记录
     */
    @PreAuthorize("@ss.hasPermi('sign:record:edit')")
    @Log(title = "考勤记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SignRecord signRecord)
    {
        return toAjax(signRecordService.updateSignRecord(signRecord));
    }

    /**
     * 删除考勤记录
     */
    @PreAuthorize("@ss.hasPermi('sign:record:remove')")
    @Log(title = "考勤记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {
        return toAjax(signRecordService.deleteSignRecordByRecordIds(recordIds));
    }
}
