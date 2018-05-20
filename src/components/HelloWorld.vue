<template>
  <FORM id="loginForm">
    <h1>{{msg}}</h1>
        <div class="acount">
          <span style="width: 20%" class="cellphone">手机号：</span><span class="required">*</span>
          <input class="accountInput" type="text" style="width: 35%" />
        </div>
    <br/>
        <div class="acount">
          <span style="width: 20%" class="cellphone">验证码：</span><span class="required">*</span>
          <input class='accountInput' type="text" style="width: 20%"/>
          <button style="width: 14%" id="getValidateCode" type="button">获取验证码</button>
        </div>
    <br/>
        <div class="login_btn">
          <input type="submit" value="登陆">
        </div>
  </FORM>
</template>

<script>
export default {
  name: 'Dolphin analysis',
  data () {
    return {
      msg: 'Dolphin 金融账户分析系统'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#loginForm {
  width:600px;
  height:230px;
  margin-left:auto;
  margin-right:auto;
  text-align: center;
  background-color: #a1ffd5;
}
.cellphone {
  width: 54px;
  height: 25px;
  font-family: PingFangSC;
  font-size: 18px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: normal;
  letter-spacing: normal;
  color: #000000;
}
.required {
  width: 10px;
  height: 25px;
  font-family: PingFangSC;
  font-size: 18px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: normal;
  letter-spacing: normal;
  color: #d0021b;
}
.accountInput {
  width: 200px;
  height: 30px;
  background-color: #ffffff;
  border: solid 1px #979797;
  border: solid 1px #28131a;

}
#getValidateCode {
  width: 22px;
  height: 30px;
  background-color: #d8d8d8;
  border: solid 1px #979797;
  border: solid 1px #28131a;
}
.login_btn input{
  width: 350px;
  height: 40px;
  background-color: #d8d8d8;
  border: solid 1px #979797;
  border: solid 1px #2c3e50;
}
</style>
