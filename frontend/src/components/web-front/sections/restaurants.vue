<template>
  <div>
    <div class="items-center" style="float: center">
      <h4>Popular Restaurants</h4>
    </div>
    <section class="q-pa-md">
      <div class="row items-center justify-between">
        <card-restaurant class="q-ma-lg" v-for="restaurant, index of restaurants" :key="index" v-bind="restaurant" />
      </div>
    </section>
  </div>
</template>
<style scoped>
</style>
<script>
import { ref } from "vue";
import cardRestaurant from "components/cards/restaurant";
export default {
  name: "sectionRestautants",
  components: {
    cardRestaurant,
  },
  data () {
    return {
      showOffer: true,
      restaurants: [],
      slide: ref(1),
    };
  },
  methods: {
    getData () {
      this.$api.get("/api/restaurants/").then((response) => {
        this.restaurants = response.data;
      })
    },

  },
  created: function () {
    this.getData();
  },
};
</script>
