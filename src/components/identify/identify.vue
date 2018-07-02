<template>
  <div>
    <canvas id="identify-canvas" :width="contentWidth" :height="contentHeight"></canvas>
  </div>
</template>

<script>
  export default {
    name: "identify",
    props: {
      identityrefresh: {
        type: Boolean,
        default:false
      },
      identifyCode: {
        type: String,
        default: '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
      },
      fontSizeMin: {
        type: Number,
        default: 30
      },
      fontSizeMax: {
        type: Number,
        default: 40
      },
      backgroundColorMin: {
        type: Number,
        default: 180
      },
      backgroundColorMax: {
        type: Number,
        default: 240
      },
      colorMin: {
        type: Number,
        default: 50
      },
      colorMax: {
        type: Number,
        default: 160
      },
      lineColorMin: {
        type: Number,
        default: 40
      },
      lineColorMax: {
        type: Number,
        default: 100
      },
      dotColorMin: {
        type: Number,
        default: 0
      },
      dotColorMax: {
        type: Number,
        default: 255
      },
      contentWidth: {
        type: Number,
        default: 130
      },
      contentHeight: {
        type: Number,
        default: 44
      }
    },
    data() {
      return {
        eventuallyCode: ""
      }
    },
    methods: {
      // 生成一个随机数
      randomNum(min, max) {
        return Math.floor(Math.random() * (max - min) + min)
      },
      // 生成一个随机的颜色
      randomColor(min, max) {
        let r = this.randomNum(min, max)
        let g = this.randomNum(min, max)
        let b = this.randomNum(min, max)
        return 'rgb(' + r + ',' + g + ',' + b + ')'
      },
      drawPic() {
        let canvas = document.getElementById('identify-canvas')
        let ctx = canvas.getContext('2d')
        ctx.textBaseline = 'bottom'
        // 绘制背景
        ctx.fillStyle = this.randomColor(this.backgroundColorMin, this.backgroundColorMax)
        ctx.fillRect(0, 0, this.contentWidth, this.contentHeight)
        this.eventuallyCode=""
        var charIndex
        for (let i = 0; i < 4; i++) {
          var numOrLetter = this.randomNum(0, 2)
          if (numOrLetter === 0){
            charIndex = this.randomNum(0, 11)
            this.eventuallyCode += this.identifyCode[charIndex]
            this.drawText(ctx, this.identifyCode[charIndex], i)
          } else {
            charIndex = this.randomNum(11, this.identifyCode.length)
            this.eventuallyCode += this.identifyCode[charIndex]
            this.drawText(ctx, this.identifyCode[charIndex], i)
          }
        }
        this.drawLine(ctx)
        this.drawDot(ctx)
      },
      drawText(ctx, txt, i) {
        ctx.fillStyle = this.randomColor(this.colorMin, this.colorMax)
        ctx.font ='bold ' + this.randomNum(this.fontSizeMin, this.fontSizeMax) + 'px SimHei'
        let x = (i + 1) * (this.contentWidth / (4 + 1))
        let y = this.randomNum(this.fontSizeMax, this.contentHeight - 5)
        var deg = this.randomNum(-30, 30)
        // 修改坐标原点和旋转角度
        ctx.translate(x, y)
        ctx.rotate(deg * Math.PI / 180)
        ctx.fillText(txt, 0, 0)
        // 恢复坐标原点和旋转角度
        ctx.rotate(-deg * Math.PI / 180)
        ctx.translate(-x, -y)
      },
      drawLine(ctx) {
        // 绘制干扰线
        for (let i = 0; i < 8; i++) {
          ctx.strokeStyle = this.randomColor(this.lineColorMin, this.lineColorMax)
          ctx.beginPath()
          ctx.moveTo(this.randomNum(0, this.contentWidth), this.randomNum(0, this.contentHeight))
          ctx.lineTo(this.randomNum(0, this.contentWidth), this.randomNum(0, this.contentHeight))
          ctx.stroke()
        }
      },
      drawDot(ctx) {
        // 绘制干扰点
        for (let i = 0; i < 100; i++) {
          ctx.fillStyle = this.randomColor(0, 255)
          ctx.beginPath()
          ctx.arc(this.randomNum(0, this.contentWidth), this.randomNum(0, this.contentHeight), 1, 0, 2 * Math.PI)
          ctx.fill()
        }
      },
      sendEventuallyCode(){
        var sum = 0
        for (let i = 0; i< this.eventuallyCode.length; i++){
          if ($.isNumeric(this.eventuallyCode[i])){
            sum += parseInt(this.eventuallyCode[i])
          }
        }
        this.$emit('myevent', sum)
      }
    },
    watch: {
      identityrefresh() {
        this.drawPic()
        this.sendEventuallyCode()
      }
    },
    mounted() {
      this.drawPic()
      this.sendEventuallyCode()
    }
  }
</script>

<style scoped>

</style>
