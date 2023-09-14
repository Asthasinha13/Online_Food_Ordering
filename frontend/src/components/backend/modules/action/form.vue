<template>
  <q-card bordered class="q-pa-md q-mt-md" style="max-width: calc(100vw / 3.5)">
    <h5 class="text-center">
      {{ mode == "Add" ? "Create" : "Update" }}
      Actions
    </h5>
    <q-form @submit="submitForm()" class="row q-pa-md q-gutter-md">
      <q-select class="col-12" v-model="formData_.module_id" :options="modules" option-label="module_name"
        option-value="id" emit-value map-options label="Module" />
      <q-select class="col-12" v-model="formData_.action_name" :options="action" label="Action Name" lazy-rules
        :rules="[val => val && val.length > 0 || 'Please select something']" />
      <q-toggle v-model="formData_.status" label="Status" />

      <div class="text-center q-pa-md q-gutter-md">
        <q-btn label="Submit" color="secondary" type="submit" v-if="mode === 'Add'" />
        <q-btn label="Update" type="submit" color="amber" v-if="mode === 'Edit'" />
        <q-btn label="Reset" @click="resetForm" color="primary" flat class="q-ml-sm" />
      </div>
    </q-form>
  </q-card>
</template>
<script>
export default {
  name: 'formAction',
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
        module_id: null,
        action_name: null,
        status: null,
      },
      modules: [],
      action: ["add", "edit", "delete", "view"],
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
    getModule () {
      var self = this;
      this.$api.get("/api/actions/getModule").then(function (response) {
        self.modules = response.data;
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
        .post("/api/actions", {
          formData: {
            module_id: self.formData_.module_id,
            action_name: self.formData_.action_name,
            status: self.formData_.status,
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
      this.$api.put("/api/actions?dataId=" + this.formData.id, data)
        .then((response) => {
          console.log(response.data);
          self.isEdit = false;
          self.$emit("updateCompelete");
          self.update()
        });
    },
  },
  created () {
    this.getModule();
  },
};
</script>
