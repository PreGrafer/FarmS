<template>
  <div>
    <el-row>
      <el-card style="width: 95%;margin: 1% auto;text-align: center;padding: 20px;" v-hasPermi="['sign:record:check']">
      <h2>当前时间: {{ currentTime }}</h2>
      <el-button type="primary" v-if="isMorning" @click="signIn">签到</el-button>
      <el-button type="primary" v-else @click="signOut">签退</el-button>
      </el-card>
    </el-row>
    <el-row>
      <el-card style="width: 95%;margin: 0.5% auto;text-align: center;padding: 20px;" v-hasPermi="['sign:leave:mana']">
        <el-table :data="leaveList">
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
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['sign:leave:mana']">审批</el-button>
        </template>
      </el-table-column>
    </el-table>
      </el-card>
    </el-row>
    <el-row  v-if="show">
      <el-card style="width: 95%;margin: 0.5% auto;text-align: center;padding: 20px;" v-hasPermi="['sign:leave:holi']">
        <h2>假期申请</h2>
        <el-form ref="holiRef" :model="holi" :rules="rules" size="medium" label-width="100px">
          <el-form-item label="请假日期" prop="holiday">
            <el-date-picker type="daterange" v-model="holi.holiday"  value-format="YYYY-MM-DD" :style="{width: '50%'}" start-placeholder="开始日期" end-placeholder="结束日期" range-separator="至" clearable></el-date-picker>
          </el-form-item>
          <el-form-item>
            <el-input v-model="holi.reason" type="textarea" placeholder="请输入请假理由" :autosize="{minRows: 2, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-form>
        <el-button type="primary" @click="subHoli">提交申请</el-button>
      </el-card>
    </el-row>
    <el-row v-if="hasLeave">
      <el-card style="width: 95%;margin: 0.5% auto;text-align: center;padding: 20px;" v-hasPermi="['sign:leave:holi']">
        <h2>请假申请进度</h2>
        <el-row>
        <el-col>
          <strong>开始时间:</strong> {{ data.last_leave.leaveStartTime || '无'}}
        <strong>结束时间:</strong> {{ data.last_leave.leaveEndTime || '无'}}
        </el-col>
        <el-col>
          <strong>请假原因:</strong> {{ data.last_leave.reason || '无' }}
        <strong>请假原因:</strong> {{ data.last_leave.reply || '无' }}
          <strong>申请状态:</strong>
          <el-tag v-if="data.last_leave.leaveState === 0" type="primary">待审核</el-tag>
          <el-tag v-else-if="data.last_leave.leaveState === 1" type="success">已通过</el-tag>
          <el-tag v-else-if="data.last_leave.leaveState === 2" type="danger">未通过</el-tag>
            <el-tag v-else-if="data.last_leave.leaveState === 3" type="info">已撤销</el-tag>
        </el-col>
        </el-row>
      <el-row>
        <el-steps :active="data.last_leave.leaveState" direction="horizontal" align-center finish-status="success">
          <el-step title="待审核"/>
          <el-step title="已通过"/>
          <el-step title="未通过"/>
          <el-step title="已撤销"/>
        </el-steps>
      </el-row>
        <el-button type="primary" @click="cancelSub" v-if="!show">撤销申请</el-button>
      </el-card>
    </el-row>

    <!-- 添加或修改请假记录对话框 -->
    <el-dialog :title="审批请假记录" v-model="open" width="500px" append-to-body v-hasPermi="['sign:leave:mana']">
      <el-form :model="form" label-width="80px">
        <el-form-item label="部门编号" prop="deptId">
          <el-input readonly="true" v-model="form.deptId" placeholder="请输入部门编号" />
        </el-form-item>
        <el-form-item label="员工编号" prop="userId">
          <el-input readonly="true" v-model="form.userId" placeholder="请输入员工编号" />
        </el-form-item>
        <el-form-item label="申请时间" prop="haninTime">
          <el-date-picker readonly="true" clearable
            v-model="form.haninTime"
            type="date"
            value-format="YYYY-MM-DD">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="假期开始时间" prop="leaveStartTime">
          <el-date-picker readonly="true" clearable
            v-model="form.leaveStartTime"
            type="date"
            value-format="YYYY-MM-DD">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="假期结束时间" prop="leaveEndTime" >
          <el-date-picker readonly="true" clearable
            v-model="form.leaveEndTime"
            type="date"
            value-format="YYYY-MM-DD">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="申请状态" prop="leaveState">
          <el-select readonly="true" v-model="form.leaveState" placeholder="请选择申请状态">
            <el-option
              v-for="dict in holi_stage"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="请假事由" prop="reason">
          <el-input readonly="true" v-model="form.reason" placeholder="请输入请假事由" />
        </el-form-item>
        <el-form-item label="审批片语" prop="reply">
          <el-input v-model="form.reply" placeholder="请输入审批片语" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="pass">通过</el-button>
          <el-button @click="reject">拒绝</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
const { proxy } = getCurrentInstance();
const { holi_stage } = proxy.useDict('holi_stage');
import { ref,reactive, computed, onMounted } from 'vue';
import {getIds} from "@/api/system/user.js";
import {check} from "@/api/sign/record.js";
import {ElMessage} from "element-plus";
import {cancelLeave, getLastLeave, leaveApply, getLeave, deptListLeave, updateState} from "@/api/sign/leave.js";

const currentTime = ref(new Date().toLocaleTimeString());

const updateCurrentTime = () => {
  currentTime.value = new Date().toLocaleTimeString();
};

onMounted(() => {
  setInterval(updateCurrentTime, 1000);
  getInfo();
});

const hour = computed(() => new Date().getHours());
const isMorning = computed(() => hour.value < 12);
const data = reactive({
  info:{
    deptId: 0,
    userId: 0,
    signType: "",
  },
  holi: {
    deptId: 0,
    userId: 0,
    holiday: null,
    reason:""
  },
  last_leave: {
    leaveState: null
  },
  form: {},
  rules: {
    holiday: [{
      required: true,
      message: '日期范围不能为空',
      trigger: 'change'
    }],
  },
  holiRef: null
});

const leaveList = ref([]);
const loading = ref(true);
const show = ref(true);
const hasLeave = ref(false);
const total = ref(0);
const countRef = ref(0);
const open = ref(false);

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
}


const { holi ,rules, holiRef, form} = toRefs(data);

function getInfo() {
  countRef.value += 1;
  getIds().then(response => {
    data.info.userId = response.userId;
    data.info.deptId = response.deptId;
    data.holi.userId = response.userId;
    data.holi.deptId = response.deptId;
    console.log(data.info)
    getLastLeave(data.info.userId).then(response => {
      data.last_leave= response.data;
      response.data.leaveState == null ? hasLeave.value = false : hasLeave.value = true;
      response.data.leaveState == 0 ? show.value = false : show.value = true;
      console.log(data.last_leave)
    });
    loading.value = true;
    deptListLeave(data.info.deptId).then(response => {
      console.log(response)
      leaveList.value = response.rows;
      total.value = response.total;
      loading.value = false;
    });
  });
};

const cancelSub = () => {
  cancelLeave(data.last_leave.leaveId).then(response => {
    response.code === 200 ? ElMessage.success(response.msg) : ElMessage.warning(response.msg)
  })
  getInfo();
};
const subHoli = () =>{
  holiRef.value.validate((isValid) => {
    if (isValid) {
      const data= {
      deptId: holi.value.deptId,
      userId: holi.value.userId,
      leaveBegin: holi.value.holiday[0],
      leaveEnd: holi.value.holiday[1],
      reason: holi.value.reason
    }
    leaveApply(data).then(response => {
      response.code === 200 ? ElMessage.success(response.msg) : ElMessage.warning(response.msg)
      getInfo();
    });
    } else {
      ElMessage.warning("请完整填写信息!")
    }
  })
}

const signIn = () => {
  data.info.signType = "in";
  console.log(data.info)
  check(data.info).then(response => {
    response.code === 200 ? ElMessage.success(response.msg) : ElMessage.warning(response.msg);
    getInfo();
  })
};

const signOut = () => {
  data.info.signType = "out";
  console.log(data.info)
  check(data.info).then(response => {
    response.code === 200 ? ElMessage.success(response.msg) : ElMessage.warning(response.msg);
    getInfo();
  })
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _leaveId = row.leaveId
  getLeave(_leaveId).then(response => {
    form.value = response.data;
    open.value = true;
  });
}

const pass = () => {
  form.value.leaveState = 1;
  updateState(form.value).then(response => {
    response.code === 200 ? ElMessage.success(response.msg) : ElMessage.warning(response.msg)
    open.value = false;
    getInfo();
  })
}
const reject = () =>{
  form.value.leaveState = 2;
  updateState(form.value).then(response => {
    response.code === 200 ? ElMessage.success(response.msg) : ElMessage.warning(response.msg)
    open.value = false;
    getInfo();
  })
}
</script>