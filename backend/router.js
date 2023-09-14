var app = require('express');
var router = app.Router();
let init  = function ({_context}) {
    const controller = require('./api/'+_context.endpoint+'/controller.js');

    let action = _context.uriSegments[0]
    if(_context.req.method === 'POST'){
        action = 'add'
    }
    if(_context.req.method === 'PUT'){
        action = 'update'
    }
    if(_context.req.method === 'DELETE'){
        action = 'delete'
    }
    if(action === '' || action === undefined){
        action  = 'list'
    }
    if(isNaN(action)){
        controller[action]({_context})
    }else{
        controller.getDataByID(action)
    }
        
}

module.exports={init}