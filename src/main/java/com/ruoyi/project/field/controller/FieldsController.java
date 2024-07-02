package com.ruoyi.project.field.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.project.system.domain.SysUser;
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
import com.ruoyi.project.field.domain.Fields;
import com.ruoyi.project.field.service.IFieldsService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 农田信息Controller
 * 
 * @author ruoyi
 * @date 2024-06-30
 */
@RestController
@RequestMapping("/field/fields")
public class FieldsController extends BaseController
{
    @Autowired
    private IFieldsService fieldsService;

    /**
     * 查询农田信息列表
     */
    @PreAuthorize("@ss.hasPermi('field:fields:list')")
    @GetMapping("/list")
    public TableDataInfo list(Fields fields)
    {
        startPage();
        List<Fields> list = fieldsService.selectFieldsList(fields);
        return getDataTable(list);
    }

    /**
     * 导出农田信息列表
     */
    @PreAuthorize("@ss.hasPermi('field:fields:export')")
    @Log(title = "农田信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Fields fields)
    {
        List<Fields> list = fieldsService.selectFieldsList(fields);
        ExcelUtil<Fields> util = new ExcelUtil<Fields>(Fields.class);
        util.exportExcel(response, list, "农田信息数据");
    }

    /**
     * 获取农田信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('field:fields:query')")
    @GetMapping(value = "/{fieldId}")
    public AjaxResult getInfo(@PathVariable("fieldId") Long fieldId)
    {
        return success(fieldsService.selectFieldsByFieldId(fieldId));
    }

    /**
     * 新增农田信息
     */
    @PreAuthorize("@ss.hasPermi('field:fields:add')")
    @Log(title = "农田信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Fields fields)
    {
        return toAjax(fieldsService.insertFields(fields));
    }

    /**
     * 修改农田信息
     */
    @PreAuthorize("@ss.hasPermi('field:fields:edit')")
    @Log(title = "农田信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Fields fields)
    {
        return toAjax(fieldsService.updateFields(fields));
    }

    /**
     * 删除农田信息
     */
    @PreAuthorize("@ss.hasPermi('field:fields:remove')")
    @Log(title = "农田信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{fieldIds}")
    public AjaxResult remove(@PathVariable Long[] fieldIds)
    {
        return toAjax(fieldsService.deleteFieldsByFieldIds(fieldIds));
    }

    @PreAuthorize("@ss.hasPermi('field:fields:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file) throws Exception
    {
        ExcelUtil<Fields> util = new ExcelUtil<Fields>(Fields.class);
        List<Fields> fieldsList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = fieldsService.importFields(fieldsList, operName);
        return success(message);
    }

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response)
    {
        ExcelUtil<Fields> util = new ExcelUtil<Fields>(Fields.class);
        util.importTemplateExcel(response, "农田数据");
    }
}
