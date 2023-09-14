<template>
  <q-card style="width:320px;" :class="{ 'bg-orange-2': hover }" @mouseover="hover = true" @mouseleave="hover = false">
    <q-card-section>
      <div class="row justify-between items-center text-grey-8 no-wrap" style="font-size:14px">
        <div class="">
          By <span class="text-uppercase">{{ restaurant_name }}</span>
        </div>

        <q-icon size="sm" name="arrow_forward"></q-icon>
      </div>
      <div class="row justify-between">
        <q-rating v-model="r_rating" size="1em" :max="5" color="orange" />
        <div>{{ delivery_time }} MINS</div>
      </div>
    </q-card-section>
    <q-img :src="foodImage" width="320px" height="200px" />
    <q-separator />
    <q-card-section>
      <div class="row justify-between items-center text-grey-9 text-uppercase">
        <div>
          <h6 class="q-ma-none ellipsis" style="font-size:16px;max-width:280px">{{ item_name }}</h6>
        </div>
        <div class="row justify-between items-center full-width">
          <div>
            <p class="q-ma-none rupee" style="font-size:16px">{{ price }}</p>
          </div>
          <div>
            <!-- {{ restaurant_id }} -->
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
      </div>
    </q-card-section>
  </q-card>
</template>
<script>
export default {
    name: " restaurant-card",
    props: ['id', 'item_name', 'photo', 'price', 'rating', 'address', 'restaurant_name', 'restaurant_id'],
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
