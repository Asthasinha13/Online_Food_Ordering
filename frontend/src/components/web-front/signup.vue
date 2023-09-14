<template>
  <div class="column q-gutter-md">
    <h5>Signup Details</h5>
    <q-separator />
    <q-input label="Name" outlined />
    <q-input label="Email" outlined />
    <q-input label="Password" type="password" outlined />
    <q-input label="Mobile Number" outlined />
    <q-btn color="primary" label="Register" />
  </div>
</template>
<script>
export default {
  name: 'signupForm',
  methods: {
    signup () {

    }
  }
}
</script>