<template>
  <form class="form-signin">
    <div class="text-center mb-4">
      <img class="mb-4" src="./login_dolphin.svg" alt="" width="80%" height="80%">
      <h1 class="h3 mb-3 font-weight-normal">{{ msg }}</h1>
    </div>

    <div class="form-group form-inline">
      <input type="text" id="inputPhoneNumber" class="form-control col-md-12" placeholder="手机号" v-model="phonenumber"
             required autofocus>
      <label for="inputPhoneNumber">手机号</label>
    </div>

    <div class="form-group form-inline">
      <span class="col-md-8 form-group" id="validateCodeGroup">
        <input type="text" id="validateCode" class="form-control col-md-12" placeholder="验证码" v-model="validateCode"
               autofocus>
        <label for="validateCode">验证码</label>
      </span>
      <button id='getVCbtn' class="col-md-4 btn btn-primary" type="submit" :disabled="!validateCode_btn.show">
        <span v-show="validateCode_btn.show" @click="getValidateCode()">获取验证码</span>
        <span v-show="!validateCode_btn.show" style="color: #ffffff">{{ validateCode_btn.count }} s</span>
      </button>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> 记住用户名
      </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit" @click="login()">登录</button>
    <p class="mt-5 mb-3 text-muted text-center">&copy; 2017-2018</p>
  </form>
</template>

<script>
  import Vue from 'vue'
  import VueResource from 'vue-resource'

  Vue.use(VueResource)

  export default {
    name: 'Dolphin analysis',
    data() {
      return {
        validateCode_btn: {
          show: true,
          timer: null,
          count: 60
        },
        msg: 'Dolphin 金融账户分析系统',
        phonenumber: null,
        validateCode: null,
        phonenumberReg: /^1[34578][0-9]{9}$/,
        server_url: 'http://172.20.10.4:9966'
      }
    },

    methods: {
      intervalValidateCodeExpire() {
        const TIME_COUNT = 60
        if (!this.validateCode_btn.timer) {
          this.validateCode_btn.count = TIME_COUNT
          this.validateCode_btn.show = false
          this.validateCode_btn.timer = setInterval(() => {
            if (this.validateCode_btn.count > 0 && this.validateCode_btn.count <= TIME_COUNT) {
              this.validateCode_btn.count--
            } else {
              this.validateCode_btn.show = true
              clearInterval(this.validateCode_btn.timer)
              this.validateCode_btn.timer = null
            }
          }, 1000)
        }
      },
      getValidateCode() {
        if (!this.phonenumberReg.test(this.phonenumber)) {
          alert("请填写正确的手机号码！")
        } else {
          console.log("GET validate code for phonenumber:" + this.phonenumber)
          this.$http.get(this.server_url + '/verify/' + this.phonenumber).then(
            (response) => {
              console.log("获取验证码成功！")
              this.intervalValidateCodeExpire()
            }, (response) => {
              alert("获取验证码失败！")
            })
        }
      },
      login() {
//        if (!this.phonenumberReg.test(this.phonenumber)) {
//          alert("请填写正确的手机号码！")
//        } else {
//          console.log('登录中...')
//          this.$http.get(this.server_url + '/login/' + this.phonenumber + "/" + this.validateCode, {
//            'phonenumber': this.phonenumber,
//            'validateCode': this.validateCode
//          }, {emulateJSON: true}).then(
//            (response) => {
//              console.log("登录成功,跳到主页...")
              this.$router.push({name: 'home', params: {'phonenumber': this.phonenumber}})
//            }, (response) => {
//              alert("登录失败！")
//            }
//          )
//        }
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

  #basic-addon1,
  .form-group > label,
  .form-group > input {
    padding: var(--input-padding-y) var(--input-padding-x);
  }

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

  #validateCodeGroup {
    margin: 0;
  }

  #validateCodeGroup > label,
  #validateCodeGroup > input {
    margin-left: -14px;
  }


</style>
