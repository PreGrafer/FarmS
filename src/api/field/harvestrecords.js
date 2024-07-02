import request from '@/utils/request'

// 查询收获信息列表
export function listHarvestrecords(query) {
  return request({
    url: '/field/harvestrecords/list',
    method: 'get',
    params: query
  })
}

// 查询收获信息详细
export function getHarvestrecords(harvestId) {
  return request({
    url: '/field/harvestrecords/' + harvestId,
    method: 'get'
  })
}

// 新增收获信息
export function addHarvestrecords(data) {
  return request({
    url: '/field/harvestrecords',
    method: 'post',
    data: data
  })
}

// 修改收获信息
export function updateHarvestrecords(data) {
  return request({
    url: '/field/harvestrecords',
    method: 'put',
    data: data
  })
}

// 删除收获信息
export function delHarvestrecords(harvestId) {
  return request({
    url: '/field/harvestrecords/' + harvestId,
    method: 'delete'
  })
}
