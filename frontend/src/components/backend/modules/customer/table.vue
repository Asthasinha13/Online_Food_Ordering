<template>
  <q-table table-header-class="bg-amber-8 text-white" ref="table" @request="getData" :rows="data"
    :columns="dynamicColumns" :visible-columns="visibleColumns">
    <template v-slot:body-cell-Sl_no="props">
      <q-td>
        {{ props.rowIndex + 1 }}
      </q-td>
    </template>
    <template v-slot:body-cell-btnAction="props">
      <q-td>
        <q-btn @click="$emit('openView', { context: props.row })" flat round color="green" icon="visibility"></q-btn>
        <q-btn @click="$emit('edit', { context: props.row })" flat round color="amber" icon="edit"></q-btn>
        <q-btn @click="deleteItem(props)" flat round color="red" icon="delete"></q-btn>
      </q-td>
    </template>
  </q-table>
</template>
<script>
export default {
  name: 'tableRestaurant',
  data () {
    return {
      columns: [],
      visibleColumns: ['customer_name', 'contact_no', 'email', 'btnAction'],
      data: []
    }
  },
  computed: {
    dynamicColumns () {
      let columns = [];
      columns.push({
        name: "Sl_no",
        required: true,
        label: "Sl_No",
        align: "left",
        field: "id",
        format: (val) => `${val}`,
        sortable: true,
      });
      this.columns.forEach((field) => {
        columns.push({
          name: field.Field,
          label: field.Field,
          field: field.Field,
          sortable: true,
        });
      });
      columns.push({ name: "btnAction", label: "Action", field: "" });
      return columns;
    },
  },
  methods: {
    requestServerInteraction () {
      this.$refs.table.requestServerInteraction()
    },
    delete () {
      this.$q.dialog({
        message: 'Deleted Successfully',
        color: 'red',

      })
    },
    deleteItem (data) {
      this.$q
        .dialog({
          title: "Delete",
          message: "ARE YOU SURE TO DELETE ",
          cancel: true,
        })
        .onOk(() => {
          this.$api.delete("/api/customers?dataId=" + data.row.id)
            .then((response) => {
              console.log(response.data);
              this.$refs.table.requestServerInteraction();
              this.delete()
            });
          // console.log('OK')
        })
        .onCancel(() => {
          this.getColumns()
          // console.log('Cancel')
        })

    },
    getData () {
      this.$api.get("/api/customers/").then((response) => {
        console.log(response.data);
        this.data = response.data;
      });
    },
    getColumns () {
      this.$api.get("/api/customers/getColumns").then((response) => {
        this.columns = response.data[0];
      });
    }
  },
  created () {
    this.getData();
    this.getColumns();
  }
}
</script>