package com.github.pregrafer.project.field.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pregrafer.project.field.mapper.CropsMapper;
import com.github.pregrafer.project.field.domain.Crops;
import com.github.pregrafer.project.field.service.ICropsService;

/**
 * 作物信息Service业务层处理
 * 
 *
 * @date 2024-06-30
 */
@Service
public class CropsServiceImpl implements ICropsService 
{
    @Autowired
    private CropsMapper cropsMapper;

    /**
     * 查询作物信息
     * 
     * @param cropId 作物信息主键
     * @return 作物信息
     */
    @Override
    public Crops selectCropsByCropId(Long cropId)
    {
        return cropsMapper.selectCropsByCropId(cropId);
    }

    /**
     * 查询作物信息列表
     * 
     * @param crops 作物信息
     * @return 作物信息
     */
    @Override
    public List<Crops> selectCropsList(Crops crops)
    {
        return cropsMapper.selectCropsList(crops);
    }

    /**
     * 新增作物信息
     * 
     * @param crops 作物信息
     * @return 结果
     */
    @Override
    public int insertCrops(Crops crops)
    {
        return cropsMapper.insertCrops(crops);
    }

    /**
     * 修改作物信息
     * 
     * @param crops 作物信息
     * @return 结果
     */
    @Override
    public int updateCrops(Crops crops)
    {
        return cropsMapper.updateCrops(crops);
    }

    /**
     * 批量删除作物信息
     * 
     * @param cropIds 需要删除的作物信息主键
     * @return 结果
     */
    @Override
    public int deleteCropsByCropIds(Long[] cropIds)
    {
        return cropsMapper.deleteCropsByCropIds(cropIds);
    }

    /**
     * 删除作物信息信息
     * 
     * @param cropId 作物信息主键
     * @return 结果
     */
    @Override
    public int deleteCropsByCropId(Long cropId)
    {
        return cropsMapper.deleteCropsByCropId(cropId);
    }
}
