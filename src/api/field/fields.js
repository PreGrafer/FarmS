import request from '@/utils/request'

// 查询农田信息列表
export function listFields(query) {
  return request({
    url: '/field/fields/list',
    method: 'get',
    params: query
  })
}

// 查询农田信息详细
export function getFields(fieldId) {
  return request({
    url: '/field/fields/' + fieldId,
    method: 'get'
  })
}

// 新增农田信息
export function addFields(data) {
  return request({
    url: '/field/fields',
    method: 'post',
    data: data
  })
}

// 修改农田信息
export function updateFields(data) {
  return request({
    url: '/field/fields',
    method: 'put',
    data: data
  })
}

// 删除农田信息
export function delFields(fieldId) {
  return request({
    url: '/field/fields/' + fieldId,
    method: 'delete'
  })
}
