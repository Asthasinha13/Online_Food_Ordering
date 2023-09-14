<template>
  <q-card bordered class="q-pa-md q-mt-md" style="max-width: calc(100vw / 3.5)">
    <h4 class="text-center">
      {{ mode == "Add" ? "Create" : "Update" }}
      Menu
    </h4>
    <q-form @submit="submitForm()" class="row q-pa-md q-gutter-md">
      <q-select class="col-12" v-model="formData_.restaurant_id" :options="restaurants" option-label="restaurant_name"
        option-value="id" emit-value map-options label="Restaurant" />
      <q-input class="col-12" v-model="formData_.item_name" label="Item Name" lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" />
      <q-input class="col-12" v-model="formData_.price" label="price" lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" />
      <q-input class="col-12" v-model="formData_.half_price" label="half_price" lazy-rules
        :rules="[val => val && val.length > 0 || 'Please type something']">*</q-input>
      <q-input type="textarea" class="col-12" v-model="formData_.description" label="Description" lazy-rules
        :rules="[val => val && val.length > 0 || 'Please type something']" />
      <q-input>
        <q-uploader url="http://localhost:4444/upload" v-model="formData_.photo" class="col-12 row-5"
          label="Upload image" square flat bordered style="max-width: 300px" />
      </q-input>
      <!-- <q-input class="col-12" v-model="formData_.photo" label="photo" /> -->
      <div class="text-center q-pa-md q-gutter-md">
        <q-btn color="secondary" type="submit" label="Submit" v-if="mode === 'Add'" />
        <q-btn color="amber" type="update" label="update" v-if="mode === 'Edit'" />
        <q-btn label="reset" @click="resetForm" color="primary" flat class="q-ml-sm" />
      </div>
    </q-form>
  </q-card>
</template>
<script>
export default {
  name: 'formMenu',
  props: ["formData", "mode"],
  watch: {
    formData: {
      handler (val) {
        for (const field in this.formData_) {
          this.formData_[field] = val[field] !== undefined ? val[field] : null;
        }
      },
      deep: true,
      immediate: true,
    },
  },
  data () {
    return {
      formData_: {
        item_name: null,
        price: null,
        half_price: null,
        description: null,
        photo: null,
      },
      restaurants: []
    };
  },
  methods: {
    submit () {
      this.$q.dialog({
        message: " Submit Successfully",
        color: "secondary",
      });
    },
    update () {
      this.$q.dialog({
        message: "Update Successfully",
        color: "secondary",
      });
    },
    resetForm () {
      console.log("reset");
      for (const field in this.formData_) {
        this.formData_[field] = null;
      }
      this.$q.dialog({
        message: "Reset Successfully",
        color: "secondary",
      });
    },
    submitForm () {
      if (this.mode === "Add") {
        this.addData();
      }
      if (this.mode === "Edit") {
        this.updateData();
      }
    },
    addData () {
      var self = this;
      this.$api
        .post("/api/menu", {
          formData: {
            item_name: self.formData_.item_name,
            price: self.formData_.price,
            half_price: self.formData_.half_price,
            description: self.formData_.description,
            photo: self.formData_.photo,
            restaurant_id: self.formData_.restaurant_id
          },
        })
        .then((response) => {
          console.log(response);
          self.$emit("addComplete");
          self.submit();
        });
    },
    updateData () {
      let self = this;
      let data = {
        formData: { ...this.formData_ },
      };
      this.$api
        .put("/api/menu?dataId=" + this.formData.id, data)
        .then((response) => {
          console.log(response.data);
          self.isEdit = false;
          self.$emit("updateComplete");
          self.update();
        });
    },
    getRestaurants () {
      var self = this;
      this.$api.get("/api/menu/getRestaurants").then(function (response) {
        self.restaurants = response.data;
      });
    },
  },
  created () { this.getRestaurants() },
};
</script>
