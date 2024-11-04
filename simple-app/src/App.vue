<script setup>
const user = import.meta.env.VITE_USER || '-'
const host =  import.meta.env.VITE_HOST || '-'
const version = import.meta.env.VITE_OS_VERSION || '-'
const message = import.meta.env.VITE_MESSAGE || '- NO MESSAGE -'
</script>

<template>
<div class="xbody">
    <header>
      <img src="/k.png" style="width:200px;height:100px;">
      <h1>dperez-z</h1>
    </header>
    <main>
      <div class="current-container">
        <div class="current">
          <h1>APP3</h1>
          <h4>Version latest</h4>
        </div>
      </div>
      
    <h2>{{message}}</h2>
    <h3>User: {{user}}</h3>
    <h3>Pod: {{host}}</h3>
  </main>
</div>
</template>

<style scoped>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  background: radial-gradient(879px at 10.4% 22.3%, rgb(255, 235, 238) 0%, #04A00F 93.6%);
  min-height: 100vh;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
h1{
  text-align: center;
  font-size: 30px;
}
h2{
  text-align: center;
  padding-top: 20px;
  padding-bottom: 10px;
  font-size: 40px;
  color: #FFFFFF;
  background:rgb(0, 0,0)
}
h3{
  font-size: 20px;
  padding: 5px 0;
  color: #444;
  text-align: center;
}
.xbody {
  background: radial-gradient(879px at 10.4% 22.3%, rgb(255, 235, 238) 0%, #04A00F 93.6%);
  min-height: 100vh;
}
.current-container{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.current{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  background-color: #fff;
  margin: 30px 0;
    border-radius: 50%;
    width: 180px;
    height: 180px;
    border: 5px solid blueviolet;
}
</style>
