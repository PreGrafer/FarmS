package com.github.pregrafer.project.field.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pregrafer.project.field.mapper.HarvestrecordsMapper;
import com.github.pregrafer.project.field.domain.Harvestrecords;
import com.github.pregrafer.project.field.service.IHarvestrecordsService;

/**
 * 收获信息Service业务层处理
 * 
 *
 * @date 2024-06-30
 */
@Service
public class HarvestrecordsServiceImpl implements IHarvestrecordsService 
{
    @Autowired
    private HarvestrecordsMapper harvestrecordsMapper;

    /**
     * 查询收获信息
     * 
     * @param harvestId 收获信息主键
     * @return 收获信息
     */
    @Override
    public Harvestrecords selectHarvestrecordsByHarvestId(Long harvestId)
    {
        return harvestrecordsMapper.selectHarvestrecordsByHarvestId(harvestId);
    }

    /**
     * 查询收获信息列表
     * 
     * @param harvestrecords 收获信息
     * @return 收获信息
     */
    @Override
    public List<Harvestrecords> selectHarvestrecordsList(Harvestrecords harvestrecords)
    {
        return harvestrecordsMapper.selectHarvestrecordsList(harvestrecords);
    }

    /**
     * 新增收获信息
     * 
     * @param harvestrecords 收获信息
     * @return 结果
     */
    @Override
    public int insertHarvestrecords(Harvestrecords harvestrecords)
    {
        return harvestrecordsMapper.insertHarvestrecords(harvestrecords);
    }

    /**
     * 修改收获信息
     * 
     * @param harvestrecords 收获信息
     * @return 结果
     */
    @Override
    public int updateHarvestrecords(Harvestrecords harvestrecords)
    {
        return harvestrecordsMapper.updateHarvestrecords(harvestrecords);
    }

    /**
     * 批量删除收获信息
     * 
     * @param harvestIds 需要删除的收获信息主键
     * @return 结果
     */
    @Override
    public int deleteHarvestrecordsByHarvestIds(Long[] harvestIds)
    {
        return harvestrecordsMapper.deleteHarvestrecordsByHarvestIds(harvestIds);
    }

    /**
     * 删除收获信息信息
     * 
     * @param harvestId 收获信息主键
     * @return 结果
     */
    @Override
    public int deleteHarvestrecordsByHarvestId(Long harvestId)
    {
        return harvestrecordsMapper.deleteHarvestrecordsByHarvestId(harvestId);
    }
}
