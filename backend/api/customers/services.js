
const { default: knex } = require("knex")
const actionsLib = require( '../../libraries/actions.js')
const actions = new actionsLib({tableName: 'customers'})
function addSomething() {

}
console.log('actions' , actions)
module.exports= {...actions, addSomething}

// const { default: knex } = require("knex")

// function list({_context}) {
//     var po = {}
//     po.promise = new Promise(function(resolve, reject){
//         po.resolve = resolve
//         po.reject = reject
        
//     })
//     // _context.db.select().from('customers')
    
//     _context.db.select().from('customers') 
//     .then((response)=>{
//         po.resolve(response[0])   
//     })
//     return po.promise
// } 

// function add({_context}) {
//     var po = {}
//     po.promise = new Promise(function(resolve, reject){
//         po.resolve = resolve
//         po.reject = reject

//     })
//     _context.db('customers')
//     .insert({customer_name: _context.requestData.formData.customer_name})
//     // _context.db.raw("insert into customers (`customer_name`) values ('"+_context.requestData.formData.customer_name+"');")
//     .then((response)=>{
//         po.resolve(response[0])   
//     })
//     return po.promise
// }

// function update({_context}) {
//     var po = {}
//     po.promise = new Promise(function(resolve, reject){
//         po.resolve = resolve
//         po.reject = reject

//     })
//    _context.db('customers')
//    .where({id:_context.requestData.dataId})
//    .update(_context.requestData.formData)
//     .then((response)=>{
//         po.resolve(response[0])   
//     })
//     return po.promise
// }

// function del({_context}) {
//     var po = {}
//     po.promise = new Promise(function(resolve, reject){
//         po.resolve = resolve
//         po.reject = reject

//     })
//     _context.db('customers')
//     .where('id', _context.requestData.dataId)
//     .del()
//     .then((response)=>{
//         po.resolve(response[0])   
//     })
//     return po.promise
//         // let sql = "DELETE FROM customers WHERE id ="+_context.requestData.dataId;
//         // _context.db.raw(sql)
//         // .then((response)=>{
//         //     po.resolve(response[0])
//         // })
// }

// module.exports= {list, add ,update ,del }