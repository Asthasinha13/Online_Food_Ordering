<template>
  <q-card class="row" style="width: 400px; height: 150px border-radious:2px">
    <div class="col column q-pa-md" style="width:30rem">
      <div>
        <p class="q-my-sm text-bold text-h6">Dish_Name</p>
        <p class="q-my-sm">Rs 200</p>
        <div class="discription " style="width: 200px; height: 100px; ">
          <p>Description</p>
        </div>
      </div>
      <div style="">
        <div class="bg-grey-4" style="width: 120px; float: right; height: 120px ; margin-top:-9rem;">
          <q-img />
          <div style="float: right;">
            <q-btn>Add</q-btn>
          </div>
        </div>
      </div>
    </div>
  </q-card>
</template>

<script>
export default {
  name: "food-card",
  props: ["menu"],
};
</script>
