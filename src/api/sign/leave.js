import request from '@/utils/request'

// 查询请假记录列表
export function listLeave(query) {
  return request({
    url: '/sign/leave/list',
    method: 'get',
    params: query
  })
}

// 查询请假记录详细
export function getLeave(leaveId) {
  return request({
    url: '/sign/leave/' + leaveId,
    method: 'get'
  })
}

// 新增请假记录
export function addLeave(data) {
  return request({
    url: '/sign/leave',
    method: 'post',
    data: data
  })
}

// 修改请假记录
export function updateLeave(data) {
  return request({
    url: '/sign/leave',
    method: 'put',
    data: data
  })
}

// 删除请假记录
export function delLeave(leaveId) {
  return request({
    url: '/sign/leave/' + leaveId,
    method: 'delete'
  })
}
