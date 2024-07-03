import request from '@/utils/request'

// 查询请假记录列表
export function listLeave(query) {
  return request({
    url: '/sign/leave/list',
    method: 'get',
    params: query
  })
}

// 查询请假记录列表
export function deptListLeave(deptId) {
  return request({
    url: '/sign/leave/list/'+ deptId,
    method: 'get'
  })
}
export function cancelLeave(leaveId) {
  return request({
    url: '/sign/leave/cancelLeave',
    method: 'post',
    params: {leaveId}
  })
}

export function leaveApply(data) {
  return request({
    url: '/sign/leave/leaveApply',
    method: 'post',
    params: data
  })
}

export function getLastLeave(userId) {
  return request({
    url: '/sign/leave/userLastLeave/'+userId,
    method: 'get'
  })
}

// 查询请假记录详细
export function getLeave(leaveId) {
  return request({
    url: '/sign/leave/info/' + leaveId,
    method: 'get'
  })
}

// 查询请假记录详细
export function updateState(data) {
  return request({
    url: '/sign/leave//updateState',
    method: 'post',
    params: data
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
