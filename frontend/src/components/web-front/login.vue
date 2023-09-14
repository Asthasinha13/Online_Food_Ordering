<template>
  <div class="column q-gutter-md">
    <h5 class="q-ma-none">Login Details</h5>
    <q-separator />
    <q-input v-model="loginDetails.email" label="Email" outlined />
    <q-input v-model="loginDetails.password" type="password" label="password" outlined />
    <q-btn label="Login" color="primary" @click="login" />
  </div>
</template>
<script>
import MD5 from "crypto-js/md5"
export default {
  name: 'loginForm',
  data () {
    return {
      loginDetails: {
        email: null,
        password: null
      }
    }
  },
  methods: {
    login () {
      this.loginDetails.password = MD5(this.loginDetails.password).toString()
      this.$api.get('/api/auth/login', { params: this.loginDetails }).then((response) => {
        if (response.data.length > 0) {
          console.log(this.$store)
          this.$store.commit('app/setFrontendLogin', { login: true, user: response.data[0] })
          this.$emit('done')
        } else {
          console.log('issue', response.data)
        }
      })
    }
  }
}
</script>