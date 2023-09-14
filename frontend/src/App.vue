<template>
  <router-view>
  </router-view>
</template>

<script>
import { defineComponent } from "vue";

export default defineComponent({
  name: "App",
  created () {
    this.$store.commit('app/init')

  },
});
</script>
