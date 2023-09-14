<template>
  <q-card class="row" style="width:320px;height:320px" @click="$router.push('/restaurant/' + restaurant_name)">
    <q-img :src="foodImage" width="320px" height="200px"></q-img>
    <q-card-section>
      <div>
        <h6 class="ellipsis q-ma-none" style="max-width:280px">{{ restaurant_name }}</h6>
      </div>
      <q-rating v-model="r_rating" size="2em" :max="5" color="orange" />
    </q-card-section>
  </q-card>
</template>

<script>
export default {
  name: "restaurant-card",
  props: ['restaurant_name', 'photo', 'address', 'rating'],
  computed: {
    foodImage () {
      return this.photo === undefined || this.photo === '' || this.photo === null ? 'http://localhost:3000/defaultImages/food-' + Math.floor(Math.random() * 10) + '.webp' : this.photo
    },
    r_rating () {
      return this.rating === undefined || this.rating === '' || this.rating === null ? Math.floor(Math.random() * 100) / 10 : this.rating
    }
  }
}
</script>
