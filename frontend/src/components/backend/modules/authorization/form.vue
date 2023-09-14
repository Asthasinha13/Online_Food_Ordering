<template>
  <q-card bordered class="q-pa-md q-mt-md" style="max-width: calc(100vw / 3.5)">
    <h4 class="text-center">
      {{ mode == "Add" ? "Create" : "Update" }}
      Role Authorization
    </h4>
    <q-form @submit="submitForm()" class="row q-pa-md q-gutter-md">
      <q-select class="col-12" v-model="formData_.role_id" :options="role" option-label="name" option-value="id"
        emit-value map-options label="Role Id " />
      <q-select class="col-12" v-model="formData_.module_id" :options="module" option-label="module_name"
        option-value="id" emit-value map-options label="Module Id " />
      <q-select class="col-12" v-model="formData_.action" :options="actions" label="Action " />
      <q-input class="col-12" v-model="formData_.permission" label="Permission" />

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
  name: 'formAuthorization',
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
        role_id: null,
        user_id: null,
        module_id: null,
        action: null,
        permission: null,
      },
      role: [],
      user: [],
      module: [],
      actions: ["add", "edit", "view", "delete"],
    };
  },
  methods: {
    submit () {
      this.$q.dialog({
        message: ' Submit Successfully',
        color: 'secondary'
      })
    },
    update () {
      this.$q.dialog({
        message: 'Update Successfully',
        color: 'secondary'
      })

    },
    resetForm () {
      console.log("reset");
      for (const field in this.formData_) {
        this.formData_[field] = null;
      }
      this.$q.dialog({
        message: 'Reset Successfully',
        color: 'secondary'
      })
    }, getUser () {
      var self = this;
      this.$api
        .get("/api/authorizations/getUser")
        .then(function (response) {
          self.user = response.data;
        });
    },
    getRole () {
      var self = this;
      this.$api
        .get("/api/authorizations/getRole")
        .then(function (response) {
          self.role = response.data;
        });
    },
    getModule () {
      var self = this;
      this.$api
        .get("/api/authorizations/getModule")
        .then(function (response) {
          self.module = response.data;
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
        .post("/api/authorizations", {
          formData: {
            role_id: self.formData_.role_id,
            user_id: self.formData_.user_id,
            module_id: self.formData_.module_id,
            action: self.formData_.action,
            permission: self.formData_.permission,
          },
        })
        .then((response) => {
          console.log(response);
          self.$emit("addComplete");
          self.submit()
        });
    },
    updateData () {
      let self = this;
      let data = {
        formData: { ...this.formData_ }
      };
      this.$api.put("/api/authorizations?dataId=" + this.formData.id, data)
        .then((response) => {
          console.log(response.data);
          self.isEdit = false;
          self.$emit("updateComplete");
          self.update()
        });
    },
  },
  created () {
    this.getUser();
    this.getRole();
    this.getModule();
  },
};
</script>
