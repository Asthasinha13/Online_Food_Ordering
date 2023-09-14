
const { default: knex } = require("knex")
const actionsLib = require('../../libraries/actions.js')
const actions = new actionsLib({ tableName: 'customers' })
function login ({ _context }) {
  var po = {}
  po.promise = new Promise(function (resolve, reject) {
    po.resolve = resolve
    po.reject = reject

  })
  _context.db.table('customers_sys').select('*').where(_.context.req.query).then((response) => {
    po.resolve(response)
  })
  return po.promise
}
module.exports = { ...actions, login }
