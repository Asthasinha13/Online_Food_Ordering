<template>
  <q-card bordered class="q-pa-md q-mt-md" style="max-width: calc(100vw / 3.5)">
    <h4 class="text-center">
      {{ mode == "Add" ? "Create" : "Update" }}
      Orders Details
    </h4>
    <q-form @submit="submitForm()" class="row q-pa-md q-gutter-md">
      <q-select class="col-12" v-model="formData_.order_id" :options="orders" option-label="unit" option-value="id"
        emit-value map-options label="Order Id" />

      <q-select class="col-12" v-model="formData_.menu_id" :options="menu" option-label="item_name" option-value="id"
        emit-value map-options label="Menu Id" />
      <q-input type="number" class="col-12" v-model="formData_.price" label="price" />
      <q-select class="col-12" v-model="formData_.quantity" :options="qty" label="Quantity" />
      <q-input class="col-12" v-model="formData_.total_amount" label="Total price" />

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
  name: 'formOrderDetail',
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
        order_id: null,
        menu_id: null,
        price: null,
        quantity: null,
        total_amount: null,
      },
      orders: [],
      menu: [],
      qty: ["Half", "Full"],
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
    getOrders () {
      var self = this;
      this.$api.get("/api/order-details/getOrders").then(function (response) {
        self.orders = response.data;
      });
    },
    getMenu () {
      var self = this;
      this.$api.get("/api/order-details/getMenu").then(function (response) {
        self.menu = response.data;
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
        .post("/api/order_details", {
          formData: {
            order_id: self.formData_.order_id,
            menu_id: self.formData_.menu_id,
            price: self.formData_.price,
            quantity: self.formData_.quantity,
            total_amount: self.formData_.total_amount,
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
        .put("/api/order_details?dataId=" + this.formData.id, data)
        .then((response) => {
          console.log(response.data);
          self.isEdit = false;
          self.$emit("updateComplete");
          self.update();
        });
    },
  },
  created () {
    this.getMenu();
    this.getOrders();
  },
};
</script>
