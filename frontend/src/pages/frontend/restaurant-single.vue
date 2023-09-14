<template>
  <q-page>
    <restaurant-info v-bind="restaurant"></restaurant-info>
    <div class="row justify-center relative-position">
      <div class="row container justify-between">
        <div class="column q-gutter-md q-pa-md items-center">
          <card-dish-wide v-for="item, index of restaurantMenu" :key="index" v-bind="item">
          </card-dish-wide>
        </div>

        <div class="relative-position">
          <div class="cart">
            CART Section
          </div>
        </div>
      </div>
    </div>
  </q-page>
</template>
<style scoped>
</style>
<script>
import restaurantInfo from './restaurant-single/info'
import cardDishWide from 'components/cards/dish-wide'
export default {
  name: 'pageRestaurant',
  components: { restaurantInfo, cardDishWide },
  data () {
    return {
      restaurant: null,
      restaurantMenu: []
    }
  },
  watch: {
    restaurant (val) {
      if (val.id !== undefined) {
        this.fetchMenu()
      }
    }
  },
  methods: {
    fetchDetails () {
      this.$api.get("/api/restaurants/?restaurant_name=" + this.$route.params.restaurant_name).then((response) => {
        this.restaurant = response.data[0];
      })
    },
    fetchMenu () {
      this.$api.get("/api/menu/?restaurant_id=" + this.restaurant.id).then((response) => {
        this.restaurantMenu = response.data;
      })
    }
  },
  created () {
    this.fetchDetails()
  }
}
</script>

