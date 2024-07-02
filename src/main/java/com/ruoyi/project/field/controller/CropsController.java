package com.ruoyi.project.field.controller;

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
import com.ruoyi.project.field.domain.Crops;
import com.ruoyi.project.field.service.ICropsService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 作物信息Controller
 * 
 * @author ruoyi
 * @date 2024-06-30
 */
@RestController
@RequestMapping("/field/crops")
public class CropsController extends BaseController
{
    @Autowired
    private ICropsService cropsService;

    /**
     * 查询作物信息列表
     */
    @PreAuthorize("@ss.hasPermi('field:crops:list')")
    @GetMapping("/list")
    public TableDataInfo list(Crops crops)
    {
        startPage();
        List<Crops> list = cropsService.selectCropsList(crops);
        return getDataTable(list);
    }

    /**
     * 导出作物信息列表
     */
    @PreAuthorize("@ss.hasPermi('field:crops:export')")
    @Log(title = "作物信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Crops crops)
    {
        List<Crops> list = cropsService.selectCropsList(crops);
        ExcelUtil<Crops> util = new ExcelUtil<Crops>(Crops.class);
        util.exportExcel(response, list, "作物信息数据");
    }

    /**
     * 获取作物信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('field:crops:query')")
    @GetMapping(value = "/{cropId}")
    public AjaxResult getInfo(@PathVariable("cropId") Long cropId)
    {
        return success(cropsService.selectCropsByCropId(cropId));
    }

    /**
     * 新增作物信息
     */
    @PreAuthorize("@ss.hasPermi('field:crops:add')")
    @Log(title = "作物信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Crops crops)
    {
        return toAjax(cropsService.insertCrops(crops));
    }

    /**
     * 修改作物信息
     */
    @PreAuthorize("@ss.hasPermi('field:crops:edit')")
    @Log(title = "作物信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Crops crops)
    {
        return toAjax(cropsService.updateCrops(crops));
    }

    /**
     * 删除作物信息
     */
    @PreAuthorize("@ss.hasPermi('field:crops:remove')")
    @Log(title = "作物信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{cropIds}")
    public AjaxResult remove(@PathVariable Long[] cropIds)
    {
        return toAjax(cropsService.deleteCropsByCropIds(cropIds));
    }
}
