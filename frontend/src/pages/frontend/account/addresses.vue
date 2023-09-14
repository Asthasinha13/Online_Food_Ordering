<template>
  <h4>Your Saved Addresses</h4>
  <div class="row q-gutter-md">

    <q-card flat bordered class="q-ma-md q-pa-md text-grey-8" v-for="address, index of deliveryAddresses" :key="index"
      style="width:250px" @click="deliveryAddress = address">
      <div class="column">
        <div class="q-py-sm">
          <q-icon name="home" size="md" />{{ address.address_type }}
        </div>
        <div>
          {{ address.address }}
        </div>
        <div>
          <q-btn color="green" unelevated label="Deliver Here" />
        </div>
      </div>

    </q-card>
  </div>
</template>
<script>
export default {
  name: 'accountAddressesPage',
  data () {
    return {
      deliveryAddresses: []
    }
  },
  methods: {
    fetchDeliveryAddresses () {
      this.$api.get('/api/customer-addresses?customer_id=' + this.$store.state.app.frontendUser.id).then((response) => {
        this.deliveryAddresses = response.data
      })
    },
  },
  created () {
    this.fetchDeliveryAddresses()
  }
}
</script>