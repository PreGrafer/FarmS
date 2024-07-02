<template>
  <div>
    <el-row>
      <el-card style="width: 95%;margin: 1% auto;text-align: center;padding: 20px;" v-hasPermi="['sign:record:check']">
      <h2>当前时间: {{ currentTime }}</h2>
      <el-button type="primary" v-if="isMorning" @click="signIn">签到</el-button>
      <el-button type="primary" v-else @click="signOut">签退</el-button>
      </el-card>
    </el-row>
    <el-row v-if="hasHoliSub">
      <el-card style="width: 95%;margin: 1% auto;text-align: center;padding: 20px;" v-hasPermi="['sign:record:holi']">
        <h2>当前请假申请进度</h2>
        <el-button type="primary" @click="test">撤销申请</el-button>
      </el-card>
    </el-row>
    <el-row v-else>
      <el-card style="width: 95%;margin: 1% auto;text-align: center;padding: 20px;" v-hasPermi="['sign:record:holi']">
        <h2>假期申请</h2>
        <el-form ref="holiRef" :model="holi" :rules="rules" size="medium" label-width="100px">
          <el-form-item label="请假日期" prop="holiday">
            <el-date-picker type="daterange" v-model="holi.holiday"  value-format="YYYY-MM-DD" :style="{width: '50%'}" start-placeholder="开始日期" end-placeholder="结束日期" range-separator="至" clearable></el-date-picker>
          </el-form-item>
          <el-form-item>
            <el-input v-model="holi.reason" type="textarea" placeholder="请输入请假理由" :autosize="{minRows: 2, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-form>
        <el-button type="primary" @click="submitHoli">提交申请</el-button>
      </el-card>
    </el-row>
  </div>
</template>

<script setup>
import { ref,reactive, computed, onMounted } from 'vue';
import {getIds} from "@/api/system/user.js";
import {check} from "@/api/sign/record.js";
import {ElMessage} from "element-plus";
const currentTime = ref(new Date().toLocaleTimeString());

const updateCurrentTime = () => {
  currentTime.value = new Date().toLocaleTimeString();
};

onMounted(() => {
  setInterval(updateCurrentTime, 1000);
});

const hour = computed(() => new Date().getHours());
const isMorning = computed(() => hour.value < 12);
const data = reactive({
  hasHoliSub: false,
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
  rules: {
    holiday: [{
      required: true,
      message: '日期范围不能为空',
      trigger: 'change'
    }],
  },
  holiRef: null
});

const { info ,holi ,rules ,hasHoliSub , holiRef} = toRefs(data);

function getInfo() {
  getIds().then(response => {
    info.value.userId = response.userId;
    info.value.deptId = response.deptId;
    holi.value.userId = response.userId;
    holi.value.deptId = response.deptId;
  });
};

const signIn = () => {
  info.value.signType = "in";
  console.log(info.value)
  check(info.value).then(response => {
    console.log(response)
  })

};

const signOut = () => {
  info.value.signType = "out";
  console.log(info.value)
  check(info.value).then(response => {
    console.log(response)
  })
}

const submitHoli = () => {
  holiRef.value.validate((isValid) => {
    if (isValid) {
      console.log(holi.value)
      ElMessage.success("提交成功!")
    } else {
      ElMessage.warning("请完整填写信息!")
    }
  })
}
getInfo();
</script>