<template>
  <q-page class="bg-grey-3 fit relative-position" v-scroll="changeHeader">

    <section class="row justify-center item-center q-pa-md bg-amber-8">
      <div class="bg-amber-8 bg-red">
        <q-input standout bg-color="white" color="grey-8" id="query" outlined placeholder="Search..."
          aria-label="Search through site content" style="width:600px" />
      </div>
    </section>
    <section class="column items-center">
      <q-card flat class="bg-grey-3 q-pa-md container">
        <div class="row items-center">
          <q-select rounded dense :options="sortOptions" style="min-width:150px" outlined v-model="sort "></q-select>
          <div class="row col items-center">
            <q-chip v-if="!nonVegSelected" clickable v-bind="vegSelected ? chip.selected : chip.notSelected"
              class="q-ma-sm" size="md" label="Veg"
              @click="filter.type === 'veg' ? filter.type = null : filter.type = 'veg'" />
            <q-chip v-if="!vegSelected" clickable v-bind="nonVegSelected ? chip.selected : chip.notSelected"
              class="q-ma-sm" size="md" label="Non-Veg"
              @click="filter.type === 'non-veg' ? filter.type = null : filter.type = 'non-veg'" />
            <q-chip clickable v-bind="filter.rating > 3.9 ? chip.selected : chip.notSelected" class="q-ma-sm" size="md"
              label="Rating 4+" @click="filter.rating === 4 ? filter.rating = null : filter.rating = 4" />
            <div class="row q-gutter-sm q-ma-sm q-pa-sm">
              <q-label>Price Range</q-label>
              <q-range v-model="filter.priceRange" color="green-6" :min="0" :max="2000" style="width:300px"
                label-always />
            </div>

          </div>

        </div>

      </q-card>
    </section>
    <section class="column items-center">
      <div class="container">
        <q-tabs v-model="searchFor" align="left" active-color="amber-8">
          <q-tab name="dishes" label="Dishes"></q-tab>
          <q-tab name="restaurants" label="Restaurant"></q-tab>
        </q-tabs>
        <q-tab-panels v-model="searchFor" animated>
          <q-tab-panel name="dishes">
            <h3>Dishes</h3>
            <!-- <div class="row justify-around">
              <dish class="q-ma-md" v-for="i in 20" :key="i"></dish>

            </div> -->
          <div class="row items-center justify-around">
        <dish class="q-ma-lg" v-for="menu, index of menu" :key="index" v-bind="menu" />
      </div>
          </q-tab-panel>
          <q-tab-panel name="restaurants">
            <h3>Restaurants</h3>
      <div class="row items-center justify-between">
        <restaurant class="q-ma-lg" v-for="restaurant, index of restaurants" :key="index" v-bind="restaurant" />
      </div>
          </q-tab-panel>

        </q-tab-panels>
      </div>
    </section>

  </q-page>
</template>

<script>
import dish from "components/cards/dish";
import restaurant from "components/cards/restaurant";
export default {
  name: 'searchPage',
  components: {
    dish,
    restaurant,
  },
  data () {
    return {
            // showOffer: true,
      menu: [],
      restaurants: [],
      sortOptions: [
        { label: 'Relevance', value: 'relevance' },
        { label: 'Rating (High to Low)', value: 'rating-dsc' },
        { label: 'Delivery Time', value: 'delivery-dsc' },
        { label: 'Price (Low to High)', value: 'price-asc' },
        { label: 'Price (High to Low)', value: 'price-dsc' },
      ],
      sortBy: 'Relevance',
      filter: {
        priceRange: {
          min: 100,
          max: 1800,
        },
        type: null,
        rating: 4
      },
      searchFor: 'dishes',
      chip: {
        selected: {
          'text-color': 'white',
          color: 'green'
        },
        notSelected: {
          'text-color': 'grey-9',
          color: 'grey-9',
          outline: true
        }
      }
    };
  },
  computed: {
    vegSelected () {
      return this.filter.type === 'veg'
    },
    nonVegSelected () {
      return this.filter.type === 'non-veg'
    }
  },
  methods: {
    changeHeader (vsp, hsp) {
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
    },
     getData () {
      this.$api.get("/api/menu/").then((response) => {
        this.menu = response.data;
      });
      this.$api.get("/api/restaurants/").then((response) => {
        this.restaurants = response.data;
      })
    },
  },
    created: function () {
    this.getData();
  },
};
</script>
