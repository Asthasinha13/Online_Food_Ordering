<template>
  <div class="row justify-center bg-blue-grey-10 q-py-md q-px-lg">
    <div class="row items-center container">
      <div class="col-md-2 ">
        <q-img class="bg-grey-3" width="200px" height="200px"></q-img>
      </div>

      <div class="col-md-7 column q-pa-md q-gutter-md">
        <div class="text-h4 text-grey-2">
          {{ restaurant_name }}
        </div>
        <div class="text-subtitle text-grey-4">
          {{ cuisine_types }}
        </div>
        <div class="text-grey-4 text-subtitle">
          {{ address }}
        </div>

        <div class="row text-grey-4 text-subtitle" style="min-width:320px">
          <div class="col">
            <div class="text-white text-bold">
              <q-icon name="star" /> 3.5
            </div>
            <div>5K+ Ratings</div>

          </div>
          <q-separator color="grey-7" vertical />
          <div class="col q-px-md">
            <div class="text-white text-bold">38 mins</div>
            <div>Delivery Time</div>
          </div>
          <q-separator color="grey-7" vertical />
          <div class="col q-px-md">
            <div class="text-white text-bold rupee">200</div>
            <div>Cost for two</div>
          </div>

        </div>

      </div>
      <div class="col-md-3 q-mt-lg relative-position" style="border: 1px solid white; height:150px">
        <div class="q-pa-lg text-h4 text-thin absolute bg-blue-grey-10 text-white" style="top:-45px;left:10px ">
          OFFER
        </div>
      </div>
    </div>

  </div>
</template>
<script>
export default {
  name: 'restaurantInfo',
  props: ['restaurant_name', 'address']
}
</script>