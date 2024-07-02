package com.ruoyi.project.field.mapper;

import java.util.List;
import com.ruoyi.project.field.domain.Crops;

/**
 * 作物信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-06-30
 */
public interface CropsMapper 
{
    /**
     * 查询作物信息
     * 
     * @param cropId 作物信息主键
     * @return 作物信息
     */
    public Crops selectCropsByCropId(Long cropId);

    /**
     * 查询作物信息列表
     * 
     * @param crops 作物信息
     * @return 作物信息集合
     */
    public List<Crops> selectCropsList(Crops crops);

    /**
     * 新增作物信息
     * 
     * @param crops 作物信息
     * @return 结果
     */
    public int insertCrops(Crops crops);

    /**
     * 修改作物信息
     * 
     * @param crops 作物信息
     * @return 结果
     */
    public int updateCrops(Crops crops);

    /**
     * 删除作物信息
     * 
     * @param cropId 作物信息主键
     * @return 结果
     */
    public int deleteCropsByCropId(Long cropId);

    /**
     * 批量删除作物信息
     * 
     * @param cropIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCropsByCropIds(Long[] cropIds);
}
