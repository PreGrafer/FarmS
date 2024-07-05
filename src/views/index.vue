<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :span="24">
        <el-carousel :interval="3000" type="card" height="400px">
          <!-- 第一张图片：动物疫苗接种 -->
          <el-carousel-item>
            <img src="https://file.psd.cn/p/stock/20221014/ozgfaa4ljod.jpg" alt="image 1" style="width: 100%; height: auto;">
            <div class="carousel-caption"/>
          </el-carousel-item>
          <!-- 第二张图片：动物检疫站 -->
          <el-carousel-item>
            <img src="https://apple101.com.my/data/2017/08/4.jpg" alt="image 2" style="width: 100%; height: auto;">
            <div class="carousel-caption"/>
          </el-carousel-item>
          <!-- 第三张图片：动物防疫知识 -->
          <el-carousel-item>
            <img src="https://x0.ifengimg.com/ucms/2022_43/0CB292C2B8CFE3BE2FA810D98C94CCB658725218_size1581_w1269_h714.png" alt="image 3" style="width: 100%; height: auto;">
            <div class="carousel-caption"/>
          </el-carousel-item>
        </el-carousel>
      </el-col>
    </el-row>
    <el-divider/>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      version: "1.0.0",
    }
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    }
  }
}
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

