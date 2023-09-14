<template>
  <q-card bordered class="q-pa-md q-mt-md" style="max-width: calc(100vw / 3.5)">
    <h4 class="text-center">
      {{ mode == "Add" ? "Create" : "Update" }} Orders
    </h4>
    <q-form @submit="submitForm()" class="q-pa-md q-gutter-md">
      <div class="row justify-start q-gutter-md">
        <q-select use-input ref="customerSelect" v-model="customer" :options="filteredCustomers" option-value="id"
          @filter="searchCustomer" map-options label="Customer" :option-label="
            (item) => {
              return item?.customer_name + ',' + item?.contact_no;
            }
          " :rules="[(val) => val || 'Please type something']">
          <template v-slot:after>
            <q-btn dense unelevated icon="add" @click="openCustomerForm">
            </q-btn>
          </template>
        </q-select>
        <q-card flat bordered>
          <div class="row item-center q-pa-md q-gutter-md">
            <div>
              <strong> Customer Name : </strong>{{ customer?.customer_name }}
            </div>
            <div>Mobile Number:{{ customer?.contact_no }}</div>
            <div>Email ID:{{ customer?.email }}</div>
            <div>Date of Birth :{{ customer?.dob }}</div>
            <div>Gender : {{ customer?.gender }}</div>
            <div>Address :{{ customer?.address }}</div>
          </div>
        </q-card>
      </div>
      <div class="row q-gutter-md">
        <q-select class="col-2" v-model="selectedMenu" :options="menu" option-label="item_name" option-value="id"
          map-options label="Menu" />
        <div>
          <q-radio v-model="orderDetail.shape" val="Half" label="Half" />
          <q-radio v-model="orderDetail.shape" val="Full" label="Full" />
        </div>
        <q-input v-model="orderDetail.quantity" type="number" label="Qty" />
        <q-input disable type="number" :model-value="
          orderDetail.shape === 'Full'
            ? selectedMenu?.price
            : selectedMenu?.half_price
        " label="price" />
        <div class="text-center q-pa-md q-gutter-md">
          <q-btn unelevated color="secondary" label="Add" :disabled="addDisable" @click="insertOrderDetail">
          </q-btn>
          <q-btn label="Reset" @click="resetForm" color="red" flat class="q-ml-sm" />
        </div>
      </div>

      <q-table table-header-class="bg-blue-2" ref="table" @request="getData" :columns="orderDetailColumns"
        :rows="formData_.orderDetails">
        <template v-slot:body-cell-total_amount="props">
          <div class="text-right">
            {{ props.row.price * props.row.quantity }}
          </div>
        </template>
        <template v-slot:body-cell-Sl_no="cols">
          <q-td>
            {{ cols.rowIndex + 1 }}
          </q-td>
        </template>
        <template v-slot:body-cell-btnAction="props">
          <q-td>
            <div class="text-right">
              <q-btn @click="deleteorderItem(props.rowIndex)" flat round color="red" icon="delete"></q-btn>
            </div>
          </q-td>
        </template>
      </q-table>
      <div class="text-right q-pa-md q-gutter-md">
        <!-- <q-btn color="secondary" type="submit" label="Submit" /> -->
        <q-btn color="secondary" type="submit" label="Submit" v-if="mode === 'Add'" />
        <q-btn color="amber" type="update" label="update" v-if="mode === 'Edit'" />
        <q-btn v-close-popup label="Close" color="red" flat class="q-ml-sm" />
      </div>
    </q-form>
  </q-card>
  <q-dialog v-model="customerForm.open">
    <q-card>
      <customer-form mode="Add" @addComplete="
        (data) => {
          customerForm.open = false;
          getCustomers({ defaultValue: data.newId });
        }
      "></customer-form>
    </q-card>
  </q-dialog>
</template>
<script>
import CustomerForm from "components/backend/modules/customer/form";
export default {
  name: 'formOrder',
  components: {
    CustomerForm,
  },
  props: ["formData", "mode"],
  computed: {
    addDisable () {
      if (
        this.selectedMenu !== null &&
        this.orderDetail.quantity !== null &&
        this.orderDetail.quantity !== ""
      ) {
        return false;
      }
      return true;
    },
  },
  watch: {
    formData: {
      handler (val) {
        if (val === undefined) {
          return;
        }
        for (const field in this.formData_) {
          this.formData_[field] =
            val[field] !== undefined ? val[field] : this.formData_[field];
        }
      },
      deep: true,
      immediate: true,
    },
    customer (val) {
      if (val === null) {
        return;
      }
      this.formData_.customer_id = val?.id;
    },
    selectedMenu (val) {
      if (val === null) {
        return;
      }
      this.orderDetail.menu_id = val?.id;
      this.orderDetail.item_name = val?.item_name;
      this.orderDetail.price =
        this.orderDetail.shape === "Full"
          ? this.selectedMenu?.price
          : this.selectedMenu?.half_price;
    },
  },
  data () {
    return {
      orderDetail: {
        menu_id: null,
        item_name: null,
        quantity: null,
        shape: "Half",
        unit: null,
        price: null,
      },
      customer: null,
      selectedMenu: null,
      customerForm: {
        open: false,
      },
      formData_: {
        customer_id: null,
        orderDetails: [],
      },
      orderDetailColumns: [
        {
          name: "Sl_no",
          required: true,
          label: "Sl_No",
          align: "left",
          field: "id",
          format: (val) => `${val}`,
          sortable: true,
        },
        { label: "Item Name", name: "item_name", field: "item_name" },
        { label: "Rate", name: "price", field: "price" },
        { label: "Qyt", name: "shape", field: "quantity" },
        { label: "Total price", name: "total_amount", field: "total_amount" },
        { label: "Action", name: "btnAction" },
      ],
      customers: [],
      menu: [],
      filteredCustomers: [],
    };
  },
  methods: {
    // add(){
    //       $q.dialog({
    //         color: 'green-4',
    //         textColor: 'white',
    //         icon: 'cloud_done',
    //         message: 'Submitted'
    //       })
    // },
    add () {
      this.$q.notify({
        message: " Item Added",
        color: "secondary",
      });
    },
    insertOrderDetail () {
      this.formData_.orderDetails.push(Object.assign({}, this.orderDetail));
      this.orderDetail = Object.assign(this.orderDetail, {
        menu_id: null,
        item_name: null,
        shape: "Half",
        quantity: null,
        price: null,
        total_amount: null,
      });
      this.selectedMenu = null;
      console.log(this.selectedMenu);
      this.add();
    },
    searchCustomer (inputValue, update, abortFn) {
      let self = this;
      const needle = inputValue.toLowerCase();
      this.filteredCustomers = this.customers.filter(
        (customer) => customer.customer_name.toLowerCase().indexOf(needle) > -1
      );
      update();
    },
    openCustomerForm () {
      this.customerForm.open = true;
    },
    submit () {
      this.$q.notify({
        message: " Submit Successfully",
        color: "secondary",
      });
    },
    update () {
      this.$q.notify({
        message: "Update Successfully",
        color: "secondary",
      });
    },
    getOrderData () {
      var self = this;
      this.$api
        .get("/api/orders/" + this.formData.id)
        .then(function (response) {
          self.formData_ = Object.assign(self.formData_, response.data);
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
    getMenu () {
      var self = this;
      this.$api.get("/api/orders/getMenu").then(function (response) {
        self.menu = response.data;
      });
    },
    getCustomers ({ defaultValue }) {
      var self = this;
      this.$api.get("/api/orders/getCustomers").then(function (response) {
        self.customers = response.data;
        if (defaultValue === undefined) {
          return;
        }
        let customer = self.customers.find((customer) => {
          return customer.id === defaultValue;
        });
        self.customer = customer;
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
        .post("/api/orders", {
          formData: {
            customer_id: self.formData_.customer_id,
            orderDetails: self.formData_.orderDetails,
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
        .put("/api/orders?dataId=" + this.formData.id, data)
        .then((response) => {
          console.log(response.data);
          self.isEdit = false;
          self.$emit("updateComplete");
          self.update();
          //self.$router.push("../")
        });
    },
    delete () {
      this.$q.dialog({
        message: "Deleted Successfully",
        color: "red",
      });
    },

    deleteorderItem (index) {
      this.$q
        .dialog({
          title: "Delete",
          message: "ARE YOU SURE TO DELETE ",
          cancel: true,
        })
        .onOk(() => {
          this.formData_.orderDetails.splice(index, 1);
          this.delete();
        })
        .onCancel(() => {
          this.getColumns();
          // console.log('Cancel')
        });
    },
  },
  created () {
    this.getMenu();
    this.getCustomers({});
    if (this.mode === "Edit") {
      this.getOrderData();
    }
  },
};
</script>
