<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light flex-column flex-md-row" id="navgation">
    <img src="./home_dolphin.svg" alt="" width="5%" height="5%">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="nav nav-pills nav-fill mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">主页<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="marketDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            市场
          </a>
          <div class="dropdown-menu" aria-labelledby="matrixDropdownMenuLink">
            <a class="dropdown-item" href="#">拉美</a>
            <a class="dropdown-item" href="#">亚太</a>
            <a class="dropdown-item" href="#">澳洲</a>
            <a class="dropdown-item" href="#">东欧</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">极地</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#">能量潮</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="matrixDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            指标
          </a>
          <div class="dropdown-menu" aria-labelledby="matrixDropdownMenuLink">
            <a class="dropdown-item" href="#">振动升降</a>
            <a class="dropdown-item" href="#">能量潮</a>
            <a class="dropdown-item" href="#">变异离散量</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">停损点</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#">期望</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#">停损点</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="aboutDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            帮助
          </a>
          <div class="dropdown-menu" aria-labelledby="aboutDropdownMenuLink">
            <a class="dropdown-item" href="#">课堂</a>
            <a class="dropdown-item" href="#">链接</a>
            <a class="dropdown-item" href="#">更多</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">关于</a>
          </div>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="搜索" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
      </form>
    </div>
    <img src="./user.svg" alt="" width="5%" height="5%">
    <div class="dropdown" id="acount">
      <a class="dropdown-toggle" href="#" id="acountDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        账户
      </a>
      <div class="dropdown-menu" aria-labelledby="acountDropdownMenuLink">
        <a class="dropdown-item" href="#">个人信息</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#">退出</a>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: "home",
  data(){
     return {
       msg: 'welcome',
       params: this.$route.params
     }
  }
}
</script>

<style scoped>

  #navgation {
    margin: -50px 100px;
  }

  a:link    {color: #6ba900;}
  a:visited {color: #057a55;}
  a:hover   {color: #e71935; text-decoration-line: underline;}
  a:active  {color:yellow;}

 #acount {
   margin-left: -8px;
 }


</style>
