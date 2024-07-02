<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="部门编号" prop="deptId">
        <el-input
          v-model="queryParams.deptId"
          placeholder="请输入部门编号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="员工编号" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入员工编号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="申请时间" prop="haninTime">
        <el-date-picker clearable
          v-model="queryParams.haninTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择申请时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="申请状态" prop="leaveState">
        <el-select v-model="queryParams.leaveState" placeholder="请选择申请状态" clearable>
          <el-option
            v-for="dict in holi_stage"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['sign:leave:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['sign:leave:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['sign:leave:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['sign:leave:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="leaveList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="记录编号" align="center" prop="leaveId" />
      <el-table-column label="部门编号" align="center" prop="deptId" />
      <el-table-column label="员工编号" align="center" prop="userId" />
      <el-table-column label="申请时间" align="center" prop="haninTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.haninTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="假期开始时间" align="center" prop="leaveStartTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.leaveStartTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="假期结束时间" align="center" prop="leaveEndTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.leaveEndTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="申请状态" align="center" prop="leaveState">
        <template #default="scope">
          <dict-tag :options="holi_stage" :value="scope.row.leaveState"/>
        </template>
      </el-table-column>
      <el-table-column label="请假事由" align="center" prop="reason" />
      <el-table-column label="审批片语" align="center" prop="reply" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['sign:leave:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['sign:leave:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改请假记录对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="leaveRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="部门编号" prop="deptId">
          <el-input v-model="form.deptId" placeholder="请输入部门编号" />
        </el-form-item>
        <el-form-item label="员工编号" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入员工编号" />
        </el-form-item>
        <el-form-item label="申请时间" prop="haninTime">
          <el-date-picker clearable
            v-model="form.haninTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择申请时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="假期开始时间" prop="leaveStartTime">
          <el-date-picker clearable
            v-model="form.leaveStartTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择假期开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="假期结束时间" prop="leaveEndTime">
          <el-date-picker clearable
            v-model="form.leaveEndTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择假期结束时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="申请状态" prop="leaveState">
          <el-select v-model="form.leaveState" placeholder="请选择申请状态">
            <el-option
              v-for="dict in holi_stage"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="请假事由" prop="reason">
          <el-input v-model="form.reason" placeholder="请输入请假事由" />
        </el-form-item>
        <el-form-item label="审批片语" prop="reply">
          <el-input v-model="form.reply" placeholder="请输入审批片语" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Leave">
import { listLeave, getLeave, delLeave, addLeave, updateLeave } from "@/api/sign/leave";

const { proxy } = getCurrentInstance();
const { holi_stage } = proxy.useDict('holi_stage');

const leaveList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    deptId: null,
    userId: null,
    haninTime: null,
    leaveState: null,
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询请假记录列表 */
function getList() {
  loading.value = true;
  listLeave(queryParams.value).then(response => {
    leaveList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    leaveId: null,
    deptId: null,
    userId: null,
    haninTime: null,
    leaveStartTime: null,
    leaveEndTime: null,
    leaveState: null,
    reason: null,
    reply: null
  };
  proxy.resetForm("leaveRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.leaveId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加请假记录";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _leaveId = row.leaveId || ids.value
  getLeave(_leaveId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改请假记录";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["leaveRef"].validate(valid => {
    if (valid) {
      if (form.value.leaveId != null) {
        updateLeave(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addLeave(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _leaveIds = row.leaveId || ids.value;
  proxy.$modal.confirm('是否确认删除请假记录编号为"' + _leaveIds + '"的数据项？').then(function() {
    return delLeave(_leaveIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('sign/leave/export', {
    ...queryParams.value
  }, `leave_${new Date().getTime()}.xlsx`)
}

getList();
</script>
