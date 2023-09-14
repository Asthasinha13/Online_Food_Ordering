
const { default: knex } = require("knex")
const actionsLib = require('../../libraries/actions.js')
const actions = new actionsLib({ tableName: 'authorizations' })
function getRole ({ _context }) {
  var po = {}
  po.promise = new Promise(function (resolve, reject) {
    po.resolve = resolve
    po.reject = reject

  })
  _context.db.table('roles_sys').select('*').then((response) => {
    po.resolve(response)
  })
  return po.promise
}
function getUser ({ _context }) {
  var po = {}
  po.promise = new Promise(function (resolve, reject) {
    po.resolve = resolve
    po.reject = reject

  })
  _context.db.table('users_sys').select('*').then((response) => {
    po.resolve(response)
  })
  return po.promise
}
function getModule ({ _context }) {
  var po = {}
  po.promise = new Promise(function (resolve, reject) {
    po.resolve = resolve
    po.reject = reject

  })
  _context.db.table('modules_sys').select('*').then((response) => {
    po.resolve(response)
  })
  return po.promise
}
console.log('actions', actions)
module.exports = { ...actions, getRole, getUser, getModule }
