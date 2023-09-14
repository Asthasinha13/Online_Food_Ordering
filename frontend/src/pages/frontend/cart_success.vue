<template>
  <q-page class="fit">
    <div class="container row full-height items-center justify-center">
      <q-card class="bg-green text-white q-pa-lg" style="width:500px">
        <h4>Order Placed Successfully</h4>
        <p>Redirecting to Home Page in 5 Secs</p>
      </q-card>
    </div>
  </q-page>
</template>
<script>
export default {
  name: "cartSuccess",
  mounted () {
    setTimeout(() => {
      this.$router.push('/')
    }, 5000)
  }
}
</script>
