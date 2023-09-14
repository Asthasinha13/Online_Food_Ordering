<template>
  <div>
    <card-order class="q-ma-md" v-for="i in 10" :key="i"></card-order>
  </div>
</template>
<script>
import cardOrder from 'components/cards/order'
export default {
  name: 'accountFavoritesPage',
  components: { cardOrder }
}
</script>