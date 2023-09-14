<template>
  <div class="q-pa-md bg-orange-1 fit">
    <div class="q-gutter-md items-start justify-start">
      <div class="row items-center q-gutter-md">
        <div>
          <h3 class="q-ma-none">Customers</h3>
        </div>
        <div>
          <q-btn @click="form.data = {}; form.mode = 'Add'; form.open = true;" color="green"
            @mouseleave="buttonHover = false" @mouseover="buttonHover = true">
            <q-icon name="add" />
            <transition appear enter-active-class="animated slideInDown" leave-active-class="animated slideOutUp">
              <span v-if="buttonHover">Add</span>
            </transition>
          </q-btn>
        </div>
      </div>
      <table-customer @open-view="({ context }) => { view.context = context; view.open = true }"
        @edit="({ context }) => { form.data = context; form.mode = 'Edit'; form.open = true }"></table-customer>
    </div>
    <q-dialog v-model="form.open">
      <form-customer :formData="form.data" :mode="form.mode" @update-complete="
  form.open = false;
$refs.table.requestServerInteraction();
      " @add-complete="
  form.open = false;
$refs.table.requestServerInteraction();
      ">
      </form-customer>
    </q-dialog>
    <q-dialog v-model="view.open" full-height full-width>
      <view-customer :context="view.context" />
    </q-dialog>
  </div>
</template>
<script>
import formCustomer from "./customer/form";
import tableCustomer from "./customer/table";
import viewCustomer from "./customer/view";
export default {
  name: "moduleCustomer",
  components: { formCustomer, tableCustomer, viewCustomer },
  data () {
    return {
      form: {
        open: false,
        data: {},
        mode: "Add",
      },
      view: {
        open: false,
        context: null
      },
      buttonHover: false,
      isEdit: false,
      index: null,
      formData: [],
      editData: {
        customer_name: null,
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
  }
};
</script>
