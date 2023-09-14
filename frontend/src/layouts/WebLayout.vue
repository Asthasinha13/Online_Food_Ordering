<template>
  <q-layout view="hHh lpR fff">
    <transition appear enter-active-class="animated slideInDown">
      <q-header v-if="header" bordered height-hint="98">
        <div class="row bg-white justify-center">
          <section-header></section-header>
        </div>

      </q-header>
    </transition>
    <q-page-container>
      <router-view @header="(val) => header = val" />
    </q-page-container>
    <!-- <q-footer>
      <section-footer></section-footer>
    </q-footer> -->
  </q-layout>
</template>
<script>
import sectionHeader from "components/web-front/sections/header";
import sectionFooter from "components/web-front/sections/footer";
export default {
  components: {
    sectionHeader
  },
  data () {
    return {
      header: true
    }
  }
}
</script>


