<template>
  <q-card bordered class="q-pa-md q-mt-md" style="max-width: calc(100vw / 3.5)">
    <h4 class="text-center">
      {{ mode == "Add" ? "Create" : "Update" }}
      Restaurant
    </h4>
    <q-form @submit="submitForm()" class="row q-pa-md q-gutter-md">
      <q-input class="col-12" v-model="formData_.restaurant_name" label="Restaurant name" lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" />
      <q-input type="textarea" class="col-12" v-model="formData_.address" label="Address" lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" />
      <q-input class="col-12" v-model="formData_.pin_code" label="pin code" />
      <q-input class="col-12" v-model="formData_.contact_number" label="contact number" lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" />
      <q-input class="col-12" v-model="formData_.email" input-class="text-right" label-slot clearable lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" label="Email" />
      <q-input type="textarea" class="col-12" v-model="formData_.description" label="Description" lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" />
      <q-input class="col-12" v-model="formData_.licence" label="Licence" lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" />
      <q-input class="col-12" v-model="formData_.fssai_licence" label="Fssai Licence" lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" />
      <q-input class="col-12" v-model="formData_.gst_no" label="Gst Number" lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" />
      <div class="text-center q-pa-md q-gutter-md">
        <q-btn color="secondary" type="submit" label="Submit" v-if="mode === 'Add'" />
        <q-btn color="amber" type="update" label="update" v-if="mode === 'Edit'" />
        <q-btn label="Reset" @click="resetForm" color="primary" flat class="q-ml-sm" />
      </div>
    </q-form>
  </q-card>
</template>
<script>
export default {
  name: 'formRestaurant',
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
        restaurant_name: null,
        address: null,
        pin_code: null,
        contact_number: null,
        email: null,
        description: null,
        licence: null,
        fssai_licence: null,
        gst_no: null,
      },
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
        .post("/api/restaurants", {
          formData: {
            restaurant_name: self.formData_.restaurant_name,
            address: self.formData_.address,
            pin_code: self.formData_.pin_code,
            contact_number: self.formData_.contact_number,
            email: self.formData_.email,
            description: self.formData_.description,
            licence: self.formData_.licence,
            fssai_licence: self.formData_.fssai_licence,
            gst_no: self.formData_.gst_no,
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
        .put("/api/restaurants?dataId=" + this.formData.id, data)
        .then((response) => {
          console.log(response.data);
          self.isEdit = false;
          self.$emit("updateComplete");
          self.update();
        });
    },
  },
  created () { },
};
</script>
