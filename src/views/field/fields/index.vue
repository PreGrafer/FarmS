<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="农田id" prop="fieldId">
        <el-input
          v-model="queryParams.fieldId"
          placeholder="请输入农田id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="土壤类型" prop="soilType">
        <el-select v-model="queryParams.soilType" placeholder="请选择土壤类型" clearable>
          <el-option
            v-for="dict in soil_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="当前种植的作物id" prop="currentCropId">
        <el-input
          v-model="queryParams.currentCropId"
          placeholder="请输入当前种植的作物id"
          clearable
          @keyup.enter="handleQuery"
        />
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
          v-hasPermi="['field:fields:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['field:fields:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['field:fields:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="info"
            plain
            icon="Upload"
            @click="handleImport"
            v-hasPermi="['field:fields:import']"
        >导入</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['field:fields:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="fieldsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="农田id" align="center" prop="fieldId" />
      <el-table-column label="面积/亩" align="center" prop="area" />
      <el-table-column label="纬度" align="center" prop="latitude" />
      <el-table-column label="经度" align="center" prop="longitude" />
      <el-table-column label="土壤类型" align="center" prop="soilType">
        <template #default="scope">
          <dict-tag :options="soil_type" :value="scope.row.soilType"/>
        </template>
      </el-table-column>
      <el-table-column label="当前种植的作物id" align="center" prop="currentCropId" />
      <el-table-column label="信息" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" @click="showMap(scope.row)" v-hasPermi="['field:fields:map']">定位</el-button>
          <el-button link type="primary" @click="weather(scope.row)" v-hasPermi="['field:fields:wea']">天气</el-button>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['field:fields:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['field:fields:remove']">删除</el-button>
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

    <!-- 添加或修改农田信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="fieldsRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="面积/亩" prop="area">
          <el-input v-model="form.area" placeholder="请输入面积/亩" />
        </el-form-item>
        <el-form-item label="纬度" prop="latitude">
          <el-input v-model="form.latitude" placeholder="请输入纬度" />
        </el-form-item>
        <el-form-item label="经度" prop="longitude">
          <el-input v-model="form.longitude" placeholder="请输入经度" />
        </el-form-item>
        <el-form-item label="土壤类型" prop="soilType">
          <el-select v-model="form.soilType" placeholder="请选择土壤类型">
            <el-option
              v-for="dict in soil_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="当前种植的作物id" prop="currentCropId">
          <el-input v-model="form.currentCropId" placeholder="请输入当前种植的作物id" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
    <!-- 天气 -->
      <el-dialog :title="wea_title" v-model="wea_open" width="900px" append-to-body>
        <el-row :gutter="20">
      <el-col :span="12" v-for="(day, index) in weatherData" :key="index">
        <weather-card :weatherData="day"></weather-card>
      </el-col>
    </el-row>
      </el-dialog>
    <!-- 地图 -->
      <el-dialog :title="map_title" v-model="map_open" width="800px" append-to-body>
          <div id="map" style="width: 100%; height: 600px"></div>
      </el-dialog>

    <!-- 用户导入对话框 -->
      <el-dialog :title="upload.title" v-model="upload.open" width="400px" append-to-body>
         <el-upload
            ref="uploadRef"
            :limit="1"
            accept=".xlsx, .xls"
            :headers="upload.headers"
            :action="upload.url"
            :disabled="upload.isUploading"
            :on-progress="handleFileUploadProgress"
            :on-success="handleFileSuccess"
            :auto-upload="false"
            drag
         >
            <el-icon class="el-icon--upload"><upload-filled /></el-icon>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
            <template #tip>
               <div class="el-upload__tip text-center">
                  <span>仅允许导入xls、xlsx格式文件。</span>
                  <el-link type="primary" :underline="false" style="font-size:12px;vertical-align: baseline;" @click="importTemplate">下载模板</el-link>
               </div>
            </template>
         </el-upload>
         <template #footer>
            <div class="dialog-footer">
               <el-button type="primary" @click="submitFileForm">确 定</el-button>
               <el-button @click="upload.open = false">取 消</el-button>
            </div>
         </template>
      </el-dialog>
  </div>
</template>

<script setup name="Fields">
import AMapLoader from '@amap/amap-jsapi-loader';
import WeatherCard from './weatherCard.vue';
import { getToken } from "@/utils/auth";
import {listFields, getFields, delFields, addFields, updateFields, weatherGet} from "@/api/field/fields";

const { proxy } = getCurrentInstance();
const { soil_type } = proxy.useDict('soil_type');

const fieldsList = ref([]);
const open = ref(false);
const wea_open = ref(false);
const wea_title = ref("");
const map_open = ref(false);
const map_title = ref("");
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const weatherData = ref([]);
const wea_config = ref({
  key: 'a202ad4b576f48639cd0367bddbf4492',
  location: ''
})

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    fieldId: null,
    soilType: null,
    currentCropId: null
  },
  rules: {
    area: [
      { required: true, message: "面积/亩不能为空", trigger: "blur" }
    ],
    latitude: [
      { required: true, message: "纬度不能为空", trigger: "blur" }
    ],
    longitude: [
      { required: true, message: "经度不能为空", trigger: "blur" }
    ],
    soilType: [
      { required: true, message: "土壤类型不能为空", trigger: "change" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询农田信息列表 */
function getList() {
  loading.value = true;
  listFields(queryParams.value).then(response => {
    fieldsList.value = response.rows;
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
    fieldId: null,
    area: null,
    latitude: null,
    longitude: null,
    soilType: null,
    currentCropId: null
  };
  proxy.resetForm("fieldsRef");
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
/** 下载模板操作 */
function importTemplate() {
  proxy.download("field/fields/importTemplate", {
  }, `field_template_${new Date().getTime()}.xlsx`);
};

/**文件上传中处理 */
const handleFileUploadProgress = (event, file, fileList) => {
  upload.isUploading = true;
};

/** 文件上传成功处理 */
const handleFileSuccess = (response, file, fileList) => {
  upload.open = false;
  upload.isUploading = false;
  proxy.$refs["uploadRef"].handleRemove(file);
  proxy.$alert("<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" + response.msg + "</div>", "导入结果", { dangerouslyUseHTMLString: true });
  getList();
};

/** 提交上传文件 */
function submitFileForm() {
  proxy.$refs["uploadRef"].submit();
};

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.fieldId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加农田信息";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _fieldId = row.fieldId || ids.value
  getFields(_fieldId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改农田信息";
  });
}

/** 导入按钮操作 */
function handleImport() {
  upload.title = "用户导入";
  upload.open = true;
};

/** 提交按钮 */
function submitForm() {
  proxy.$refs["fieldsRef"].validate(valid => {
    if (valid) {
      if (form.value.fieldId != null) {
        updateFields(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addFields(form.value).then(response => {
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
  const _fieldIds = row.fieldId || ids.value;
  proxy.$modal.confirm('是否确认删除农田信息编号为"' + _fieldIds + '"的数据项？').then(function() {
    return delFields(_fieldIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}
/*** 农田导入参数 */
const upload = reactive({
  // 是否显示弹出层（农田导入）
  open: false,
  // 弹出层标题（农田导入）
  title: "",
  // 是否禁用上传
  isUploading: false,
  // 设置上传的请求头部
  headers: { Authorization: "Bearer " + getToken() },
  // 上传的地址
  url: import.meta.env.VITE_APP_BASE_API + "/field/fields/importData",
});
/** 导出按钮操作 */
function handleExport() {
  proxy.download('field/fields/export', {
    ...queryParams.value
  }, `fields_${new Date().getTime()}.xlsx`)
}
function weather(row){
  wea_config.value.location = row.longitude + ',' + row.latitude;
  wea_open.value = true;
  wea_title.value = row.fieldId + "未来7天天气预报";
  weatherGet(wea_config.value).then(response=>{
    weatherData.value=response.data.daily;
  })
}

function showMap(row) {
  // 假设 map_open 和 map_title 已经在某处定义（可能是 Vue 的 ref 或其他状态管理）
  map_open.value = true;
  map_title.value = row.fieldId + "农田定位";

  window._AMapSecurityConfig = {
    // 请确保不要公开您的 JS 安全代码
    securityJsCode: 'f212b0057b288753ba073caba37d386a',
  };

  AMapLoader.load({
    key: 'cb853e42226eaa81f7440eebe7538e69', // 请确保不要公开您的 API 密钥
    version: '2.0',
    plugins: ['AMap.Geolocation', 'AMap.PlaceSearch', 'AMap.Scale'],
    AMapUI: {
      version: '1.1',
      plugins: [],
    },
    Loca:{
        version: '2.0.0'
    },
  })
    .then(AMap => {
      // 确保 HTML 中有一个 id="map" 的元素
      const map = new AMap.Map("map", {
        resizeEnable: true,
        zoom: 15,
        mapStyle: "amap://styles/whitesmoke",
        viewMode: "2D", //设置地图模式
        center: [row.longitude, row.latitude],
      });
      //设置圆形位置
      const center = new AMap.LngLat(row.longitude, row.latitude);
      const radius = row.area*10
      const marker = new AMap.CircleMarker({
        title: row.fieldId,
        center: center,
        radius: radius,
        strokeColor: "white",
        strokeWeight: 2,
        strokeOpacity: 0.5, //轮廓线透明度
        fillColor: "rgba(0,135,60)", //圆点填充颜色
        fillOpacity: 0.5, //圆点填充透明度
        zIndex: 10, //圆点覆盖物的叠加顺序
        cursor: "pointer", //鼠标悬停时的鼠标样式
      });
      map.add(marker);
    })
    .catch(e => {
      // 在控制台中打印错误，并考虑在用户界面上显示错误消息
      console.error(e);
      // 显示错误消息给用户（如果需要）
    });
}

getList();
</script>
