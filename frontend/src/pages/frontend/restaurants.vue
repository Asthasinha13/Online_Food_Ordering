<template>
  <q-page class="fit row justify-center bg-grey-3">
    <section-restaurants class="container" />
  </q-page>
</template>
<style scoped>
</style>

<script>
import sectionRestaurants from "components/web-front/sections/restaurants";
export default {
  name: 'pageRestaurants',
  components: {
    sectionRestaurants
  },
  data () {
    return {
      filters: {
        priceRange: {
          min: 100,
          max: 300,
        },
      },
    };
  },
};
</script>
