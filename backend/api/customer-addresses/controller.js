const { default: knex } = require('knex')
const services = require('./services')

module.exports = {
  add: ({ _context }) => {
    let { add } = require('./services.js')
    add({ _context }).then((data) => {
      _context.res.json(data)
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
    console.log(list)
    list({ _context }).then((data) => {
      _context.res.json(data)
    })
  },
  getColumns: ({ _context }) => {
    let { getColumns } = require('./services.js')
    getColumns({ _context }).then((data) => {
      _context.res.json(data)
    })
  }
}