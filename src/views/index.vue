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
      <el-col :sm="24" :lg="24">
        <blockquote class="text-warning" style="font-size: 14px">
          <br />
          <el-link
            href="https://cloud.tencent.com/redirect.php?redirect=1025&cps_key=198c8df2ed259157187173bc7f4f32fd&from=console"
            type="primary"
            target="_blank"
            >https://cloud.tencent.com/redirect.php?redirect=1025&cps_key=198c8df2ed259157187173bc7f4f32fd&from=console</el-link
          >
          <h4 class="text-danger">
            云产品通用红包，可叠加官网常规优惠使用。(仅限新用户)
          </h4>
        </blockquote>
        <hr />
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>农场信息与人力资源管理系统框架</h2>
        <p>
          一直想做一款后台管理系统，看了很多优秀的开源项目但是发现没有合适自己的。于是利用空闲休息时间开始自己写一套后台系统。如此有了若依管理系统，她可以用于所有的Web应用程序，如网站管理后台，网站会员中心，CMS，CRM，OA等等，当然，您也可以对她进行深度定制，以做出更强系统。所有前端后台代码封装过后十分精简易上手，出错概率低。同时支持移动客户端访问。系统会陆续更新一些实用功能。
        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
        <p>
          <el-tag type="danger">&yen;免费开源</el-tag>
        </p>
        <p>
          <el-button
            type="primary"
            size="mini"
            icon="el-icon-cloudy"
            plain
            @click="goTarget('https://gitee.com/y_project/RuoYi-Vue')"
            >访问码云</el-button
          >
          <el-button
            size="mini"
            icon="el-icon-s-home"
            plain
            @click="goTarget('http://ruoyi.vip')"
            >访问主页</el-button
          >
        </p>
      </el-col>
      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="12">
            <h2>技术选型</h2>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="6">
            <h4>后端技术</h4>
            <ul>
              <li>SpringBoot</li>
              <li>Spring Security</li>
              <li>JWT</li>
              <li>MyBatis</li>
              <li>Druid</li>
              <li>Fastjson</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="6">
            <h4>前端技术</h4>
            <ul>
              <li>Vue</li>
              <li>Vuex</li>
              <li>Element-ui</li>
              <li>Axios</li>
              <li>Sass</li>
              <li>Quill</li>
              <li>...</li>
            </ul>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-divider />
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>联系信息</span>
          </div>
          <div class="body">
            <p>
              <i class="el-icon-s-promotion"></i> 官网：<el-link
                href="http://www.ruoyi.vip"
                target="_blank"
                >http://www.ruoyi.vip</el-link
              >
            </p>
            <p>
              <i class="el-icon-user-solid"></i> QQ群：<s> 满937441 </s> <s> 满887144332 </s>
              <s> 满180251782 </s> <s> 满104180207 </s> <s> 满186866453 </s> <s> 满201396349 </s>
            </p>
            <p><i class="el-icon-chat-dot-round"></i> 微信：<a href="javascript:">/ *若依</a></p>
            <p><i class="el-icon-money"></i> 支付宝：<a href="javascript:;" class="支付宝信息">/*若依</a></p>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>更新日志</span>
          </div>
          <el-collapse accordion>
            <el-collapse-item title="v1.0.0 - 2023-12-08">
              <ol>
                <li>操作日志记录部门名称</li>
                <li>全局数据存储用户编号</li>
                <li>新增编程式判断资源访问权限</li>
                <li>操作日志列表新增IP地址查询</li>
                <li>定时任务新增页去除状态选项</li>
                <li>代码生成支持选择前端模板类型</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="v1.0.0 - 2019-10-08">
              <ol>
                <li>若依前后端分离系统正式发布</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {listNotice} from "@/api/system/notice";
import {getInfo} from "@/api/login";

export default {
  name: "Index",
  data() {
    return {
      // queryParams: {
      //   pageNum: 1,
      //   pageSize: 3,
      //   noticeType: 2,
      //   status: 0
      // },
      // newNotices: [],
      // 版本号
      version: "1.0.0"
    }
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    }
  },
  // created() {
  //     listNotice(this.queryParams).then(response => {
  //       console.info(response.rows);
  //       this.newNotices = response.rows;
  //     });
  // }
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

