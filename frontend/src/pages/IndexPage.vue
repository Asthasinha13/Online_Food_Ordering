<template>
  <q-page class="column items-center">
    <section class="header-image full-width">
      <div class="text-white q-my-xl">
        <div class="row justify-center item-center">
          <h2 class="q-my-sm">Welcome to FoodBuddy</h2>
        </div>
        <div class="row justify-center">
          <h4 class="q-my-sm">Discover the best food & drinks</h4>
        </div>

        <!-- <div class="banner-btn">
        <a href="#"><span></span> Find out</a>
        <a href="#"><span></span>Read more</a>
      </div> -->
        <div class="row justify-center item-center q-my-xl" role="search">
          <q-input standout bg-color="white" color="grey-8" id="query" outlined placeholder="Search..."
            aria-label="Search through site content" style="width:600px">
            <template v-slot:append>
              <q-btn unelevated rounded="false" to="/search" color="primary"><i class="fa fa-search"></i>Search
              </q-btn>
            </template>
          </q-input>

        </div>
      </div>
    </section>
    <section-dishes class="container" />
    <section-restaurants class="container" />
    <section-contactus class="full-width">
    </section-contactus>

  </q-page>
</template>
<style scoped>
.header-image {
  background: linear-gradient(rgba(27, 13, 13, 0.616), #47150edc),
    url("https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");
  background-size: cover;
}
</style>
<script>
import { ref } from "vue";
import sectionDishes from "components/web-front/sections/dishes";
import sectionRestaurants from "components/web-front/sections/restaurants";
import sectionContactus from "components/web-front/sections/contactus";
export default {
  components: {
    sectionDishes,
    sectionRestaurants,
    sectionContactus
    // menuCard
  },
  data () {
    return {
      // {
      //   name:'Features',
      //   name1:'Advance Product Option',
      //   name2:'Delivery Dashboard',
      //   name3:'Native App',
      //   name4:'Notitification Order',
      //   name5:'Ordering Editor',
      //   name6:'Ordering Widget',
      //   name7:'Business App',
      //   name8:'Delivery Website',
      //   name9:'Ordering Website',
      //   name10:'Support Website',
      // }
      slide: ref(1),
    }
  },
  methods: {
    getData () {
      this.$api.get("/api/menu/").then((response) => {
        console.log(response.data);
        this.formData = response.data;
      });
    },
    created () {
      this.getData();
    },
  }
};
</script>
