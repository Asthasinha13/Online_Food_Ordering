
const { default: knex } = require("knex")
const actionsLib = require('../../libraries/actions.js')
const actions = new actionsLib({ tableName: 'menu' })
function getRestaurants ({ _context }) {
  var po = {}
  po.promise = new Promise(function (resolve, reject) {
    po.resolve = resolve
    po.reject = reject

  })
  _context.db.table('restaurants_sys').select('*').then((response) => {
    po.resolve(response)
  })
  return po.promise
}
module.exports = { ...actions, getRestaurants }
