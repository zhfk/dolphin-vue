<template>
    <table class="table table-bordered table-dark col-md-12">
      <tbody>
      <tr>
        <td>账户名</td>
        <td>性别</td>
        <td>年龄</td>
        <td>资产</td>
      </tr>
      <tr>
        <td>{{ user }}</td>
        <td>{{ sex }}</td>
        <td>1000岁</td>
        <td>1000亿元</td>
      </tr>
      </tbody>
    </table>
</template>

<script>
    export default {
        name: "",
        props: {
          user: {
            type: String,
            default : ""
          },
          sex:{
            type: String,
            default : "男"
          }
        },
      data(){
          return {
            showThis: null
          }
      }
    }
</script>

<style scoped>

</style>
