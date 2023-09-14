<template>
  <q-page :class="[bgColor]" class="column items-center account-page" v-scroll="setStickyColor">
    <div class="row items-center justify-between container text-white">
      <div>
        <h4 class="text-bold q-ma-lg">{{ $store.state.app.frontendUser?.customer_name }}</h4>
      </div>
      <div>
        <q-btn unelevated outline text-color="white" label="Edit Profile" />
      </div>
    </div>
    <div class="column account-page items-center container">
      <q-card flat class="fit row">
        <div class="bg-blue-grey-2" style="width:200px">
          <q-list :class="{ sticky: sticky }" separator>
            <q-item active-class="bg-white" v-for="item, index of menu" :key="index" clickable v-ripple :to="item.to">
              <q-item-section class="q-py-lg" avatar>
                <q-avatar :icon="item.icon"></q-avatar>
              </q-item-section>
              <q-item-section>
                <q-item-label>{{ item.label }}</q-item-label>
              </q-item-section>
            </q-item>
          </q-list>
        </div>
        <div class="col q-pa-lg scroll">
          <router-view></router-view>
        </div>
      </q-card>
    </div>
    <q-page-sticky v-if="sticky" expand position="top">
      <transition appear enter-active-class="animated slideInDown">
        <div class="row items-center justify-center bg-amber-8 full-width">
          <div class="row items-center justify-between container text-white">
            <div>
              <h4 class="text-bold q-ma-lg">{{ $store.state.app.frontendUser?.customer_name }}</h4>
            </div>
            <div>
              <q-btn unelevated outline text-color="white" label="Edit Profile" />
            </div>
          </div>
        </div>
      </transition>
    </q-page-sticky>
  </q-page>
</template>
<style scoped>
.account-page {
  transition: background-color 300ms linear
}

.sticky {
  position: sticky;
  top: 100px;
}
</style>
<script>
export default {
  name: 'accountPage',
  data () {
    return {
      menu: [
        {
          label: 'Orders',
          to: './orders',
          icon: 'shop'
        },
        {
          label: 'Addresses',
          to: './addresses',
          icon: 'location_on'
        },
        {
          label: 'Settings',
          to: './settings',
          icon: 'settings'
        },

      ],
      bgColor: 'bg-amber-8',
      sticky: false,
      vsp: 0
    }
  },
  methods: {
    setStickyColor (vsp, hsp) {
      this.vsp = vsp
      if (vsp > 100) {
        this.bgColor = 'bg-white'
        this.sticky = true
        this.$emit('header', false)
      } else {
        this.bgColor = "bg-amber-8"
        this.sticky = false
        this.$emit('header', true)
      }
    }
  }
}
</script>
