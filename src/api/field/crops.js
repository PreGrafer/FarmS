import request from '@/utils/request'

// 查询作物信息列表
export function listCrops(query) {
  return request({
    url: '/field/crops/list',
    method: 'get',
    params: query
  })
}

// 查询作物信息详细
export function getCrops(cropId) {
  return request({
    url: '/field/crops/' + cropId,
    method: 'get'
  })
}

// 新增作物信息
export function addCrops(data) {
  return request({
    url: '/field/crops',
    method: 'post',
    data: data
  })
}

// 修改作物信息
export function updateCrops(data) {
  return request({
    url: '/field/crops',
    method: 'put',
    data: data
  })
}

// 删除作物信息
export function delCrops(cropId) {
  return request({
    url: '/field/crops/' + cropId,
    method: 'delete'
  })
}
