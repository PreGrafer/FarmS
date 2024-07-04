<template>
  <el-card class="weather-card" shadow="hover">
    <h2>{{ weatherData.fxDate }} 天气预报</h2>
    <el-row :gutter="20">
      <el-col :span="12">
        <el-card>
          <p>日出时间: {{ weatherData.sunrise }}</p>
          <p>日落时间: {{ weatherData.sunset }}</p>
          <p>月升时间: {{ weatherData.moonrise }}</p>
          <p>月落时间: {{ weatherData.moonset }}</p>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card>
          <p>最高温度: {{ weatherData.tempMax }}℃</p>
          <p>最低温度: {{ weatherData.tempMin }}℃</p>
          <p>白天: {{ weatherData.textDay }}</p>
          <p>夜间: {{ weatherData.textNight }}</p>
          <p>降水量: {{ weatherData.precip }}mm</p>
        </el-card>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="12">
        <el-card>
          <p>白天风速: {{ weatherData.windSpeedDay }} km/h</p>
          <p>白天风向: {{ weatherData.windDirDay }}</p>
          <p>白天风力等级: {{ weatherData.windScaleDay }}</p>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card>
          <p>夜间风速: {{ weatherData.windSpeedNight }} km/h</p>
          <p>夜间风向: {{ weatherData.windDirNight }}</p>
          <p>夜间风力等级: {{ weatherData.windScaleNight }}</p>
        </el-card>
      </el-col>
    </el-row>
  </el-card>
</template>

<script>
import { ElCard, ElRow, ElCol } from 'element-plus';

export default defineComponent({
  name: 'WeatherCard',
  components: {
    ElCard,
    ElRow,
    ElCol,
  },
  props: {
    weatherData: {
      type: Object,
      required: true,
    },
  },
});
</script>

<style scoped>
.weather-card {
  width: 400px;
  margin: 5px auto;
}
</style>
