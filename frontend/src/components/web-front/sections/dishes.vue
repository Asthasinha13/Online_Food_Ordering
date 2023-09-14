<template>
  <section>
    <div class="items-center">
      <h4>Popular Dishes</h4>
    </div>
    <div class="q-pa-md">
      <div class="row items-center justify-around">
        <card-dish class="q-ma-lg" v-for="menu, index of menu" :key="index" v-bind="menu" />
      </div>
    </div>
  </section>
</template>
<script>
import { ref } from "vue";
import cardDish from "components/cards/dish";
export default {
  name: "sectionDishes",
  components: {
    cardDish,
  },
  data () {
    return {
      showOffer: true,
      menu: [],
      slide: ref(1),
    };
  },
  methods: {
    getData () {
      this.$api.get("/api/menu/").then((response) => {
        this.menu = response.data;
      });
    },

  },
  created: function () {
    this.getData();
  },
};
</script>
