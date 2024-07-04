package com.github.pregrafer.project.field.controller;

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
import com.github.pregrafer.framework.aspectj.lang.annotation.Log;
import com.github.pregrafer.framework.aspectj.lang.enums.BusinessType;
import com.github.pregrafer.project.field.domain.Harvestrecords;
import com.github.pregrafer.project.field.service.IHarvestrecordsService;
import com.github.pregrafer.framework.web.controller.BaseController;
import com.github.pregrafer.framework.web.domain.AjaxResult;
import com.github.pregrafer.common.utils.poi.ExcelUtil;
import com.github.pregrafer.framework.web.page.TableDataInfo;

/**
 * 收获信息Controller
 * 
 *
 * @date 2024-06-30
 */
@RestController
@RequestMapping("/field/harvestrecords")
public class HarvestrecordsController extends BaseController
{
    @Autowired
    private IHarvestrecordsService harvestrecordsService;

    /**
     * 查询收获信息列表
     */
    @PreAuthorize("@ss.hasPermi('field:harvestrecords:list')")
    @GetMapping("/list")
    public TableDataInfo list(Harvestrecords harvestrecords)
    {
        startPage();
        List<Harvestrecords> list = harvestrecordsService.selectHarvestrecordsList(harvestrecords);
        return getDataTable(list);
    }

    /**
     * 导出收获信息列表
     */
    @PreAuthorize("@ss.hasPermi('field:harvestrecords:export')")
    @Log(title = "收获信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Harvestrecords harvestrecords)
    {
        List<Harvestrecords> list = harvestrecordsService.selectHarvestrecordsList(harvestrecords);
        ExcelUtil<Harvestrecords> util = new ExcelUtil<Harvestrecords>(Harvestrecords.class);
        util.exportExcel(response, list, "收获信息数据");
    }

    /**
     * 获取收获信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('field:harvestrecords:query')")
    @GetMapping(value = "/{harvestId}")
    public AjaxResult getInfo(@PathVariable("harvestId") Long harvestId)
    {
        return success(harvestrecordsService.selectHarvestrecordsByHarvestId(harvestId));
    }

    /**
     * 新增收获信息
     */
    @PreAuthorize("@ss.hasPermi('field:harvestrecords:add')")
    @Log(title = "收获信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Harvestrecords harvestrecords)
    {
        return toAjax(harvestrecordsService.insertHarvestrecords(harvestrecords));
    }

    /**
     * 修改收获信息
     */
    @PreAuthorize("@ss.hasPermi('field:harvestrecords:edit')")
    @Log(title = "收获信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Harvestrecords harvestrecords)
    {
        return toAjax(harvestrecordsService.updateHarvestrecords(harvestrecords));
    }

    /**
     * 删除收获信息
     */
    @PreAuthorize("@ss.hasPermi('field:harvestrecords:remove')")
    @Log(title = "收获信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{harvestIds}")
    public AjaxResult remove(@PathVariable Long[] harvestIds)
    {
        return toAjax(harvestrecordsService.deleteHarvestrecordsByHarvestIds(harvestIds));
    }
}
