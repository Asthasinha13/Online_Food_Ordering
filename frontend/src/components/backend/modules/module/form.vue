<template>
  <q-card bordered class="q-pa-md q-mt-md" style="max-width: calc(100vw / 3.5)">
    <h4 class="text-center">
      {{ mode == "Add" ? "Create" : "Update" }}
      Modules
    </h4>
    <q-form @submit="submitForm()" class="row q-pa-md q-gutter-md">
      <q-input class="col-12" v-model="formData_.module_name" label="Module Name" lazy-rules
        :rules="[(val) => (val && val.length > 0) || 'Please type something']" />
      <q-toggle v-model="formData_.status" label="Status" />
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
  name: 'formModule',
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
        module_name: null,
        status: null,
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
        .post("/api/module", {
          formData: {
            module_name: self.formData_.module_name,
            status: self.formData_.status,
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
        .put("/api/module?dataId=" + this.formData.id, data)
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
