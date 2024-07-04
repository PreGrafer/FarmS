package com.github.pregrafer.project.field.service;

import java.util.List;
import com.github.pregrafer.project.field.domain.Crops;

/**
 * 作物信息Service接口
 * 
 *
 * @date 2024-06-30
 */
public interface ICropsService 
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
     * 批量删除作物信息
     * 
     * @param cropIds 需要删除的作物信息主键集合
     * @return 结果
     */
    public int deleteCropsByCropIds(Long[] cropIds);

    /**
     * 删除作物信息信息
     * 
     * @param cropId 作物信息主键
     * @return 结果
     */
    public int deleteCropsByCropId(Long cropId);
}
