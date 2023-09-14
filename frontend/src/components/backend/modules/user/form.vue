<template>
  <q-card bordered class="q-pa-md q-mt-md" style="max-width: calc(100vw / 3.5)">
    <h4 class="text-center">
      {{ mode == "Add" ? "Create" : "Update" }}
      User
    </h4>
    <q-form @submit="submitForm()" class="row q-pa-md q-gutter-md">
      <q-input class="col-12" v-model="formData_.name" label-slot type="gmail" lazy-rules
        :rules="[val => val && val.length > 0 || 'Please type something']" label="Name" />
      <q-input class="col-12" v-model="formData_.email" label-slot type="gmail" lazy-rules
        :rules="[val => val && val.length > 0 || 'Please type something']" label="Email" />

      <q-input class="col-12" v-model="formData_.user_password" label="User Password" type="password" lazy-rules
        :rules="[val => val && val.length > 0 || 'Please type something']" />
      <q-select class="col-12" v-model="formData_.role_id" :options="roles" option-label="name" option-value="id"
        emit-value map-options label="Role" />
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
  name: 'formUser',
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
        name: null,
        user_password: null,
        email: null,
        role_id: null
      },
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
        .post("/api/users", {
          formData: {
            name: self.formData_.name,
            email: self.formData_.email,
            user_password: self.formData_.user_password,
            role_id: self.formData_.role_id,
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
        formData: { ...this.formData_ },
      };
      this.$api
        .put("/api/users?dataId=" + this.formData.id, data)
        .then((response) => {
          console.log(response.data);
          self.isEdit = false;
          self.$emit("updateComplete");
          self.update()
        });
    },
  },
  created () { },
};
</script>
