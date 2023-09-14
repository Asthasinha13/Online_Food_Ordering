const { default: knex } = require('knex')
const services = require('./services')

module.exports = {
  add: ({ _context }) => {
    //load order services
    let { add } = require('./services.js')
    //store order details seperately for further processing after order creaation 
    let orderDetails = _context.requestData.formData.orderDetails

    //perform insert action
    add({ _context }).then((data) => {
      console.log(data)

      //insert order id in order details
      orderDetails.map((orderDetail) => {
        orderDetail.order_id = data
      })
      console.log(orderDetails)

      //load order details service
      const orderDetailService = require('../order-details/services.js')

      //create fresh context for order details
      let _contextOrderDetails = {}
      _contextOrderDetails.db = _context.db
      _contextOrderDetails.requestData = {
        formData: orderDetails
      }

      //perform insert action in order_details
      orderDetailService.add({ _context: _contextOrderDetails }).then((data) => {
        _context.res.json(data)
      })
    })

  },
  update: ({ _context }) => {
    let { update } = require('./services.js')
    update({ _context }).then((data) => {
      _context.res.json(data)
    })
  },
  delete: ({ _context }) => {
    let { del } = require('./services.js')
    del({ _context }).then((data) => {
      _context.res.json(data)
    })
  },

  list: ({ _context }) => {
    let { list } = require('./services.js')
    list({ _context }).then((data) => {
      _context.res.json(data)
    })
  },
  getColumns: ({ _context }) => {
    let { getColumns } = require('./services.js')
    getColumns({ _context }).then((data) => {
      _context.res.json(data)
    })
  },
  getDataByID: ({ _context }) => {
    let { getDataByID } = require('./services.js')
    getDataByID({ _context }).then((order) => {
      const orderDetailService = require('../order_details/services.js')
      let _contextOrderDetails = {}
      _contextOrderDetails.db = _context.db
      orderDetailService.list({ _context: _contextOrderDetails }).then((orderDetails) => {
        console.log(orderDetails)
        order[0].orderDetails = orderDetails
        console.log(order[0])
        _context.res.json(order[0])
      })
    })
  },
  getCustomers: ({ _context }) => {
    let { getCustomers } = require('./services.js')
    getCustomers({ _context }).then((data) => {
      _context.res.json(data)
    })
  },
  getMenu: ({ _context }) => {
    let { getMenu } = require('./services.js')
    getMenu({ _context }).then((data) => {
      _context.res.json(data)
    })
  },
  createOrder: ({ _context }) => {
    let { createOrder } = require('./services.js')
    createOrder({ _context }).then((data) => {
      _context.res.json(data)
    })
  },
}