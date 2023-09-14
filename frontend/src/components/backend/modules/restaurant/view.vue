<template>
  <q-card>
    <q-tabs align="left" active-color="amber-8" v-model="activeTab">
      <q-tab name="info" label="Info" />
      <q-tab name="menu" label="Menu" />
    </q-tabs>
    <q-tab-panels v-model="activeTab">
      <q-tab-panel name="info">
        <div class="row">
          <q-card flat bordered class="q-ma-md q-py-md q-pr-md q-pl-lg relative-position"
            v-for="value, field of context" :key="field" style="width:320px">
            <div class="absolute-left bg-grey-8" style="width:5px; height:80"></div>
            <div class="text-bold text-uppercase">{{ field.replaceAll('_', ' ') }}</div>
            <div>{{ value }}</div>
          </q-card>
        </div>
      </q-tab-panel>
      <q-tab-panel name="menu">
        <h3></h3>
        <page-menu :context="{ restaurant_id: context.id }"></page-menu>
      </q-tab-panel>
    </q-tab-panels>
  </q-card>
</template>
<script>
import pageMenu from 'components/backend/modules/menu'
export default {
  name: 'viewRestaurant',
  props: ['context'],
  components: { pageMenu },
  data () {
    return {
      activeTab: 'info'
    }
  }
}
</script>