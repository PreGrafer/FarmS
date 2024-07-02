package com.ruoyi.project.field.mapper;

import java.util.List;
import com.ruoyi.project.field.domain.Harvestrecords;

/**
 * 收获信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-06-30
 */
public interface HarvestrecordsMapper 
{
    /**
     * 查询收获信息
     * 
     * @param harvestId 收获信息主键
     * @return 收获信息
     */
    public Harvestrecords selectHarvestrecordsByHarvestId(Long harvestId);

    /**
     * 查询收获信息列表
     * 
     * @param harvestrecords 收获信息
     * @return 收获信息集合
     */
    public List<Harvestrecords> selectHarvestrecordsList(Harvestrecords harvestrecords);

    /**
     * 新增收获信息
     * 
     * @param harvestrecords 收获信息
     * @return 结果
     */
    public int insertHarvestrecords(Harvestrecords harvestrecords);

    /**
     * 修改收获信息
     * 
     * @param harvestrecords 收获信息
     * @return 结果
     */
    public int updateHarvestrecords(Harvestrecords harvestrecords);

    /**
     * 删除收获信息
     * 
     * @param harvestId 收获信息主键
     * @return 结果
     */
    public int deleteHarvestrecordsByHarvestId(Long harvestId);

    /**
     * 批量删除收获信息
     * 
     * @param harvestIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHarvestrecordsByHarvestIds(Long[] harvestIds);
}
