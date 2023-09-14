const { default: knex } = require('knex')
const services = require('./services')

module.exports = {

  login: ({ _context }) => {
    let { list } = require('./services.js')
    console.log(list)
    list({ _context }).then((data) => {
      _context.res.json(data)
    })
  }
}