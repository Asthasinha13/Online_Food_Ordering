
const { default: knex } = require("knex")
const actionsLib = require( '../../libraries/actions.js')
const actions = new actionsLib({tableName: 'order_details'})
function getOrders({_context}) {
    var po = {}
    po.promise = new Promise(function(resolve, reject){
        po.resolve = resolve
        po.reject = reject

    })
    _context.db.table('orders_sys').select('*').then((response)=>{
        po.resolve(response)
    })
    return po.promise
}
function getMenu({_context}) {
    var po = {}
    po.promise = new Promise(function(resolve, reject){
        po.resolve = resolve
        po.reject = reject

    })
    _context.db.table('menu_sys').select('*').then((response)=>{
        po.resolve(response)
    })
    return po.promise
}
console.log('actions' , actions)
module.exports= {...actions, getOrders,getMenu}

