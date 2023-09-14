<template>
  <q-card style="width:620px;" :class="{ 'bg-orange-2': hover }" @mouseover="hover = true" @mouseleave="hover = false">
    <q-card-section>
      <div class="row justify-between items-center text-grey-9 text-uppercase">
        <div class="row q-gutter-sm">
          <q-img :src="foodImage" width="80px" height="80px" />
          <q-separator vertical />
          <div class="column">
            <h6 class="q-ma-none" style="font-size:16px">{{ item_name }}</h6>
            <p class="q-ma-none rupee" style="font-size:16px">{{ price }}</p>
          </div>
        </div>
        <div>
          <q-btn v-if="cartQuantity === 0" color="green" label="Add" :outline="!hover" padding="sm xl"
            @click="$store.commit('app/addCartItem', { item: { id, item_name, photo, price, rating, restaurant_name, restaurant_id, address, quantity: 1 } })" />
          <q-btn-group class="q-mx-md" color="green" v-else>
            <q-btn dense color="green" flat @click="$store.commit('app/decreaseQuantity', { id })"
              :icon="cartQuantity === 1 ? 'delete' : 'remove'">
            </q-btn>
            <q-btn dense flat color="green">{{ cartQuantity }}</q-btn>
            <q-btn dense flat color="green" @click="$store.commit('app/increaseQuantity', { id })" icon="add"></q-btn>
          </q-btn-group>
        </div>
      </div>
    </q-card-section>
  </q-card>
</template>
<script>
export default {
  name: "cardDishWide",
  props: ['id', 'item_name', 'photo', 'price', 'address', 'rating', 'restaurant_name', 'restaurant_id'],
  data () {
    return { hover: false }
  },
  computed: {
    cartQuantity () {
      console.log(this.id)
      const dish = this.$store.state.app.cartItems.find(item => item.id === this.id)
      console.log(dish)
      return dish !== undefined ? dish.quantity : 0
    },
    foodImage () {
      return this.photo === undefined || this.photo !== '' || this.photo === null ?
        'http://localhost:3000/defaultImages/food-' + Math.floor(Math.random() * 10) + '.webp' : this.photo
    },
    r_rating () {
      return this.rating === undefined || this.rating === '' || this.rating === null ? Math.floor(Math.random()
        * 100) / 10 : this.rating
    },
    delivery_time () {
      return Math.floor(Math.random() * 100 / 3 * 2)
    }
  }
}
</script>
