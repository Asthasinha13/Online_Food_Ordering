
const { default: knex } = require("knex")
const actionsLib = require('../../libraries/actions.js')
const actions = new actionsLib({ tableName: 'orders' })
function getCustomers ({ _context }) {
  var po = {}
  po.promise = new Promise(function (resolve, reject) {
    po.resolve = resolve
    po.reject = reject

  })
  _context.db.table('customers_sys').select('*').then((response) => {
    po.resolve(response)
  })
  return po.promise
}
function getMenu ({ _context }) {
  var po = {}
  po.promise = new Promise(function (resolve, reject) {
    po.resolve = resolve
    po.reject = reject

  })
  _context.db.table('menu_sys').select('*').then((response) => {
    po.resolve(response)
  })
  return po.promise
}
function createOrder ({ _context }) {
  console.log(_context.req.body)
}
console.log('actions', actions)
module.exports = { ...actions, getCustomers, getMenu, createOrder }
