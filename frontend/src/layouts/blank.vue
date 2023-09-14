<template>
  <q-layout view="lHh Lpr lFf">
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
    link: "/customers/",
  },
  {
    title: "Action",
    icon: "star_border",
    // icon-selected:"star",
    // icon-half="star_half",
    // icon: 'action',
    link: "/action/",
  },
  {
    title: "Delivery Staff",
    icon: "person",
    link: "/delivery_staff/",
  },
  {
    title: "Menu",
    icon: "layers",
    link: "/menu/",
  },
  {
    title: "Module",
    icon: "menu",
    link: "/module/",
  },
  {
    title: "Orders",
    icon: "list",
    link: "/orders/",
  },
  // {
  //   title: 'Order Details',
  //   icon: 'receipt',
  //   link: '/order_details/'
  // },
  {
    title: "Payment",
    icon: "payment",
    link: "/payment/",
  },
  {
    title: "Restaurant",
    icon: "restaurant",
    link: "/restaurant/",
  },
  {
    title: "Role",
    icon: "star",
    link: "/role/",
  },
  {
    title: "Role Authorization",
    icon: "stars",
    link: "/role_authorization/",
  },
  {
    title: "User",
    icon: "star",
    // icon: 'cart',<i class="bi bi-door-open-fill"></i>
    link: "/user/",
  },
];
export default defineComponent({
  name: "MainLayout",

  components: {
    //EssentialLink,
  },

  setup() {
    const leftDrawerOpen = ref(false);

    return {
      essentialLinks: linksList,
      leftDrawerOpen,
      toggleLeftDrawer() {
        leftDrawerOpen.value = !leftDrawerOpen.value;
      },
    };
  },
});
</script>
