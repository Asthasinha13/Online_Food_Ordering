
const { default: knex } = require("knex")
const actionsLib = require('../../libraries/actions.js')
const actions = new actionsLib({ tableName: 'delivery_staffs' })
function addSomething () {

}
console.log('actions', actions)
module.exports = { ...actions, addSomething }
