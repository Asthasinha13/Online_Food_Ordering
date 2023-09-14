<template>
  <div>
    <card-order class="q-ma-md" v-for="order, index of orders" :key="index" v-bind="order"></card-order>
  </div>
</template>
<script>
import cardOrder from 'components/cards/order'
export default {
  name: 'accountOrderPage',
  components: { cardOrder },
  data () {
    return {
      orders: []
    }
  },
  methods: {
    fetchOrders () {
      this.$api.get('/api/orders?customer_id=' + this.$store.state.app.frontendUser?.id).then((response) => {
        this.orders = response.data
      })
    }
  },
  created () {
    this.fetchOrders()
  }
}
</script>