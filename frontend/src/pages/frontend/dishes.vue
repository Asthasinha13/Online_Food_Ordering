<template>
  <q-page class="bg-grey-3 column items-center">
    <section-dishes class="container" />
  </q-page>
</template>
<style scoped>
</style>
<script>
import sectionDishes from "components/web-front/sections/dishes";
export default {
  name: "pageDishes",
  components: {
    sectionDishes
  },

};
</script>
