<template>
  <q-card square flat bordered class="q-pa-md">
    <div class="column">
      <div class="row" style="height:100px">
        <div class="col-lg-2">
          <q-img :src="foodImage" fit="cover" />
        </div>
        <div class="col-lg-6 q-px-md">
          <p class="text-h6 q-ma-sm text-grey-9">MOMO MAGIC CAFE</p>
          <p class="text-subtitle q-ma-sm text-grey-6">Chitragupt Nagar</p>
          <p class="text-subtitle q-ma-sm text-grey-6">Order #136470828875 | Tue,May 24, 2022, 06:03 PM</p>
        </div>
        <div class="col-lg-4">
          <p class="text-h6 q-ma-sm text-grey-8 text-caption">Delivered on Tue, May 24, 2022, 06:47 PM <q-badge
              icon="cart"></q-badge>
          </p>
        </div>

      </div>
      <hr />
      <div class="row justify-between text-grey-8">
        <div>
          Chicken MOMO 8Pcs x 1
        </div>
        <div>
          Total Paid: <span class="rupee">152</span>
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
  props: ['restaurant_name', 'address', 'order_number', 'order_date', 'delivery_date'],
  computed: {
    foodImage () {
      return 'http://localhost:3000/defaultImages/food-' + Math.floor(Math.random() * 10) + '.webp'
    }
  }
}
</script>