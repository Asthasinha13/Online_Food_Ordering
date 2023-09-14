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
        <q-btn @click="view.data = props.row; view.open = true;" flat round color="green" icon="visibility"></q-btn>
        <q-btn @click="$emit('edit', { context: props.row })" flat round color="amber" icon="edit"></q-btn>
        <q-btn @click="deleteItem(props)" flat round color="red" icon="delete"></q-btn>
      </q-td>
    </template>
  </q-table>
</template>
<script>
export default {
  name: 'tableRestaurant',
  props: ['context'],
  data () {
    return {
      columns: [],
      visibleColumns: ['item_name', 'price', 'half_price', 'btnAction'],
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
          this.$api.delete("/api/menu?dataId=" + data.row.id)
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
      let url = "/api/menu/"
      this.$api.get(url, { params: this.context }).then((response) => {
        console.log(response.data);
        this.data = response.data;
      });
    },
    getColumns () {
      this.$api.get("/api/menu/getColumns").then((response) => {
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