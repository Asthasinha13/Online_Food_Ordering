<template>
  <q-card bordered class="q-pa-md q-mt-md" style="max-width: calc(100vw / 3.5)">
    <h4 class="text-center">
      {{ mode == "Add" ? "Create" : "Update" }}
      Payment
    </h4>
    <q-form @submit="submitForm()" class="row q-pa-md q-gutter-md">
      <q-select class="col-12" v-model="formData_.order_id" :options="orders" option-label="customer_id"
        option-value="id" emit-value map-options label="Order Id" lazy-rules
        :rules="[val => val || 'Please type something']" />
      <q-input type="number" class="col-12" v-model="formData_.price" label="price" lazy-rules
        :rules="[val => val && val.length > 0 || 'Please enter price']" />
      <q-select class="col-12" v-model="formData_.payment_method" :options="paymethod" label="Payment Method "
        lazy-rules :rules="[val => val && val.length > 0 || 'Please type something']" />
      <q-input type="date" class="col-12" v-model="formData_.payment_date" label="Payment Date" stack-label lazy-rules
        :rules="[val => val && val.length > 0 || 'Please type something']" />
      <q-select class="col-12" v-model="formData_.transaction_method" :options="tramethod" label="Transaction Method "
        lazy-rules :rules="[val => val && val.length > 0 || 'Please type something']" />
      <q-input class="col-12" v-model="formData_.processed_by" label="Processed By" lazy-rules
        :rules="[val => val && val.length > 0 || 'Please type something']" />
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
  name: 'formPayment',
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
        price: null,
        payment_method: null,
        payment_date: null,
        transaction_method: null,
        processed_by: null,
      },

      orders: [],
      paymethod: ["credit card", "debit card", "paypal", "visa"],
      tramethod: ["cash", "check", "prepaid card paymenys", "e-wallets"],
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
      this.$api.get("/api/payment/getOrder").then(function (response) {
        self.orders = response.data;
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
        .post("/api/payment", {
          formData: {
            order_id: self.formData_.order_id,
            price: self.formData_.price,
            payment_method: self.formData_.payment_method,
            payment_date: self.formData_.payment_date,
            transaction_method: self.formData_.transaction_method,
            processed_by: self.formData_.processed_by,
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
        .put("/api/payment?dataId=" + this.formData.id, data)
        .then((response) => {
          console.log(response.data);
          self.isEdit = false;
          self.$emit("updateComplete");
          self.update();
        });
    },
  },
  created () {
    this.getOrders();
  },
};
</script>
