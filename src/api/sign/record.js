import request from '@/utils/request'

// 查询考勤记录列表
export function listRecord(query) {
  return request({
    url: '/sign/record/list',
    method: 'get',
    params: query
  })
}

export function check(data){
  return request({
    url: '/sign/record/check',
    method: 'post',
    params: data
  })
}

// 查询考勤记录详细
export function getRecord(recordId) {
  return request({
    url: '/sign/record/' + recordId,
    method: 'get'
  })
}

// 新增考勤记录
export function addRecord(data) {
  return request({
    url: '/sign/record',
    method: 'post',
    data: data
  })
}

// 修改考勤记录
export function updateRecord(data) {
  return request({
    url: '/sign/record',
    method: 'put',
    data: data
  })
}

// 删除考勤记录
export function delRecord(recordId) {
  return request({
    url: '/sign/record/' + recordId,
    method: 'delete'
  })
}
