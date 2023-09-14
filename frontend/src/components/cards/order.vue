<template>
  <q-card square flat bordered class="q-pa-md">
    <div class="column">
      <div class="row" style="height:100px">
        <div class="col-lg-2">
          <q-img :src="foodImage" fit="cover" />
        </div>
        <div class="col-lg-6 q-px-md">
          <p class="text-h6 q-ma-sm text-grey-9">{{ restaurant_name }}</p>
          <p class="text-subtitle q-ma-sm text-grey-6">{{ address }}</p>
          <p class="text-subtitle q-ma-sm text-grey-6">Order #{{ Math.floor(Math.random() * 100000000) }} | Tue,May 24,
            2022, 06:03 PM</p>
        </div>
        <div class="col-lg-4">
          <p class="text-h6 q-ma-sm text-grey-8 text-caption">Delivered on Tue, May 24, 2022, 06:47 PM
            <q-avatar color="green" text-color="white" icon="check" size="xs">
            </q-avatar>
          </p>
        </div>

      </div>
      <hr />
      <div class="row justify-between text-grey-8">
        <div class="column">
          <div v-for="detail, index of details" :key="index">
            {{ detail.item_name }} X {{ detail.quantity }}
          </div>
        </div>

        <div>
          Total Paid: <span class="rupee">{{ grand_total }}</span>
        </div>

      </div>
      <div class="row justify-start q-gutter-md text-grey-8">
        <div>
          <q-btn padding="sm xl" unelevated color="orange" label="REORDER" />
        </div>
        <div>
          <q-btn padding="sm xl" color="orange" outline unelevated label="HELP" />
        </div>

      </div>
      <div>

      </div>
    </div>
  </q-card>
</template>
<script>
export default {
  name: 'card-order',
  props: ['restaurant_name', 'address', 'order_number', 'order_date', 'delivery_date', 'id', 'grand_total'],
  computed: {
    foodImage () {
      return 'http://localhost:3000/defaultImages/food-' + Math.floor(Math.random() * 10) + '.webp'
    }
  },
  data () {
    return {
      details: []
    }
  },
  methods: {
    fetchDetails () {
      this.$api.get('/api/order-details?order_id=' + this.id).then((response) => {
        this.details = response.data
      })
    }
  },
  created () {
    this.fetchDetails()
  }
}
</script>