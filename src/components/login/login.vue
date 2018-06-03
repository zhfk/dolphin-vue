<template>
  <form class="form-signin">
    <div class="text-center mb-4">
      <img class="mb-4" src="./login_dolphin.svg" alt="" width="80%" height="80%">
      <h1 class="h3 mb-3 font-weight-normal">{{ msg }}</h1>
    </div>

    <div class="form-group">
      <input type="text" id="inputPhoneNumber" class="form-control" placeholder="手机号" v-model="phonenumber" required autofocus>
      <label for="inputPhoneNumber">手机号</label>
    </div>


    <div class="form-group form-inline">
      <input type="text" id="validateCode" class="col-md-7 form-control" placeholder="验证码" v-model="validateCode" autofocus>
      <span class="col-md-1"></span>
      <button id='getVCbtn' class="col-md-4 btn btn-primary" type="submit" @click="getValidateCode()" >获取验证码</button>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> 记住用户名
      </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    <p class="mt-5 mb-3 text-muted text-center">&copy; 2017-2018</p>
  </form>
</template>

<script>
  import Vue from 'vue'
  import VueResource from 'vue-resource'
  Vue.use(VueResource)
export default {
  name: 'Dolphin analysis',
  data () {
    return {
      msg: 'Dolphin 金融账户分析系统',
      phonenumber: "",
      validateCode: ""
    }
  },
  methods: {
    getValidateCode(){
      console.log("GET validate code for phonenumber:"+this.phonenumber)
      this.$http.get('http://dolphin-flask.Dolphin:9966/register/'+this.phonenumber).then(
        (response) => {
          console.log("获取验证码成功！")
        }, (response) =>{
          console.log("获取验证码失败")
        })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  :root {
    --input-padding-x: .75rem;
    --input-padding-y: .75rem;
  }

  template {
    height: 100%;
  }

  template {
    display: -ms-flexbox;
    display: -webkit-box;
    display: flex;
    -ms-flex-align: center;
    -ms-flex-pack: center;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    padding-top: 40px;
    padding-bottom: 40px;
    background-color: #f5f5f5;
  }
  .form-signin {
    width: 100%;
    max-width: 420px;
    padding: 15px;
    margin: 0 auto;
  }

  .form-group {
    position: relative;
    margin-bottom: 1rem;
  }

  .form-group > input,
  .form-group > label {
    padding: var(--input-padding-y) var(--input-padding-x);

  }

  /*#getVCbtn {*/
    /*margin-left: 32px;*/
  /*}*/

  .form-group > label {
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    width: 100%;
    margin-bottom: 0; /* Override default `<label>` margin */
    line-height: 1.5;
    color: #495057;
    border: 1px solid transparent;
    border-radius: .25rem;
    transition: all .1s ease-in-out;
  }

  .form-group input::-webkit-input-placeholder {
    color: transparent;
  }

  .form-group input:-ms-input-placeholder {
    color: transparent;
  }

  .form-group input:-ms-input-placeholder {
    color: transparent;
  }

  .form-group input::-moz-placeholder {
    color: transparent;
  }

  .form-group input::placeholder {
    color: transparent;
  }

  .form-group input:not(:placeholder-shown) {
    padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
    padding-bottom: calc(var(--input-padding-y) / 3);
  }

  .form-group input:not(:placeholder-shown) ~ label {
    padding-top: calc(var(--input-padding-y) / 3);
    padding-bottom: calc(var(--input-padding-y) / 3);
    font-size: 12px;
    color: #777;
  }
</style>
