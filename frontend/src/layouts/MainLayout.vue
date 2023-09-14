<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar class="bg-orange-10">
        <q-btn flat dense round icon="menu" aria-label="Menu" @click="toggleLeftDrawer" />
        <q-toolbar-title>
          Online Food ordering System
        </q-toolbar-title>
        <!-- <div>Quasar v{{ $q.version }}</div> -->
        <div>
          <q-btn color="white" flat unelevated href="http://localhost:8080/#/login" icon="person" label="logOut" @click="
  $store.commit('app/setLogin', { login: false });
$router.push('/login')
          "></q-btn>
        </div>

      </q-toolbar>
    </q-header>

    <q-drawer v-model="leftDrawerOpen" show-if-above bordered>
      <q-list>
        <q-item-label header>
          <!-- Essential Links -->
        </q-item-label>

        <EssentialLink v-for="link in essentialLinks" :key="link.title" v-bind="link" />
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { defineComponent, ref } from "vue";
import EssentialLink from "components/EssentialLink.vue";

const linksList = [
  {
    title: "Customers",
    icon: "person",
    link: "customers",
  },
  {
    title: "Action",
    icon: "star_border",
    // icon-selected:"star",
    // icon-half="star_half",
    // icon: 'action',
    link: "actions",
  },
  {
    title: "Delivery Staff",
    icon: "person",
    link: "delivery-staffs",
  },
  {
    title: "Menu",
    icon: "layers",
    link: "menu",
  },
  {
    title: "Module",
    icon: "menu",
    link: "modules",
  },
  {
    title: "Orders",
    icon: "list",
    link: "orders",
  },
  // {
  //   title: 'Order Details',
  //   icon: 'receipt',
  //   link: '/order_details/'
  // },
  {
    title: "Payment",
    icon: "payment",
    link: "payments",
  },
  {
    title: "Restaurant",
    icon: "restaurant",
    link: "restaurants",
  },
  {
    title: "Role",
    icon: "star",
    link: "roles",
  },
  {
    title: "Authorization",
    icon: "stars",
    link: "authorizations",
  },
  {
    title: "User",
    icon: "star",
    // icon: 'cart',<i class="bi bi-door-open-fill"></i>
    link: "users",
  },
];

export default defineComponent({
  name: "MainLayout",

  components: {
    EssentialLink,
  },

  setup () {
    const leftDrawerOpen = ref(false);

    return {
      essentialLinks: linksList,
      leftDrawerOpen,
      toggleLeftDrawer () {
        leftDrawerOpen.value = !leftDrawerOpen.value;
      },
    };
  },
});
</script>
