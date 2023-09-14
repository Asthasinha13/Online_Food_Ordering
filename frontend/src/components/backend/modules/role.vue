<template>
  <div class="q-pa-md bg-orange-1 fit">
    <div class="q-gutter-md items-start justify-start">
      <div class="row items-center q-gutter-md">
        <div>
          <h3 class="q-ma-none">Roles</h3>
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
      <table-role @open-view="({ context }) => { view.context = context; view.open = true }"
        @edit="({ context }) => { form.data = context; form.mode = 'Edit'; form.open = true }"></table-role>
    </div>
    <q-dialog v-model="form.open">
      <form-role :formData="form.data" :mode="form.mode" @update-complete="
  form.open = false;
$refs.table.requestServerInteraction();
      " @add-complete="
  form.open = false;
$refs.table.requestServerInteraction();
      ">
      </form-role>
    </q-dialog>
  </div>
</template>
<script>
import formRole from "./role/form";
import tableRole from "./role/table";
export default {
  name: "moduleRole",
  components: { formRole, tableRole },
  data () {
    return {
      form: {
        open: false,
        data: {},
        mode: "Add",
      },
      view: {
        open: false
      },
      buttonHover: false,
      isEdit: false,
      index: null,
      formData: [],
      editData: {
        role_name: null,
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
