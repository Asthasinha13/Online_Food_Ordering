const { response } = require("express")
const { default: knex } = require("knex")

function init ({ _context, tableName }) {
  this.getColumnList = function ({ _context }) {

  }
  this.list = function ({ _context }) {
    var po = {}
    po.promise = new Promise(function (resolve, reject) {
      po.resolve = resolve
      po.reject = reject

    })

    let query = _context.db({ tableName: tableName + '_sys' })
      .select('*').from(tableName + '_sys')
    if (Object.keys(_context.req.query).length > 0) {
      query.where(_context.req.query)
    }
    query.then((response) => {
      po.resolve(response)
    })
    return po.promise
  }

  this.add = function ({ _context }) {
    var po = {}
    po.promise = new Promise(function (resolve, reject) {
      po.resolve = resolve
      po.reject = reject

    })
    let dbData = []
    _context.db(tableName).columnInfo().then((info) => {
      if (!Array.isArray(_context.requestData.formData)) {
        _context.requestData.formData = [_context.requestData.formData]
      }
      console.log(_context.requestData.formData)
      _context.requestData.formData.forEach((rowData) => {
        let rowDbData = {}
        Object.keys(info).forEach((fieldName) => {
          console.log('loop', fieldName, rowData)
          if (rowData[fieldName] === undefined) {
            return
          }
          rowDbData[fieldName] = rowData[fieldName]
        })
        if (Object.keys(rowDbData).length > 0) {
          dbData.push(rowDbData)
        }
      })
      console.log('dbData', dbData)
      if (dbData.length > 0) {
        _context.db(tableName)
          .insert(dbData)
          .then(response => {
            po.resolve(response[0])
          })
      } else {
        po.resolve('No Data to insert')
      }
    })
    return po.promise
  }

  this.update = function ({ _context }) {
    var po = {}
    po.promise = new Promise(function (resolve, reject) {
      po.resolve = resolve
      po.reject = reject

    })
    _context.db(tableName)
      .where({ id: _context.requestData.dataId })
      .update(_context.requestData.formData)
      .then(response => {
        po.resolve(response[0])
      })
    return po.promise
  }
  this.del = function ({ _context }) {
    var po = {}
    po.promise = new Promise(function (resolve, reject) {
      po.resolve = resolve
      po.reject = reject
    })

    _context.db(tableName)
      .where('id', _context.requestData.dataId)
      .del()
      .then(response => {
        po.resolve(response[0])
      })

    return po.promise

  },
    this.getColumns = function ({ _context }) {
      return _context.db.raw('SHOW COLUMNS FROM ' + tableName + '_sys' + ';')
    },
    this.getDataByID = function ({ _context }) {
      console.log(_context)
      var po = {}
      po.promise = new Promise(function (resolve, reject) {
        po.resolve = resolve
        po.reject = reject
      })
      _context.db({ tableName: tableName + '_sys' })
        .select('*').from(tableName + '_sys').where({ id: _context.uriSegments[0] })
        .then((response) => {
          po.resolve(response)
        })
      return po.promise
    }
}
module.exports = init
