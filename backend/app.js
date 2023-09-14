const { response } = require('express')
const cors = require('cors')
let express = require('express')
const controller = require('./api/customers/controller.js')
const app = express()
app.use(express.json()) // for parsing application/json
app.use(cors())
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded
app.use(express.static('public'))
app.use('/api', function (req, res) {
  //bootstraping
  let _context = { req, res }

  //requestdata capture
  let requestBodyData = req?.body !== undefined ? req.body : {}
  let requestQueryParams = req?.query !== undefined ? req.query : {}
  _context.requestData = Object.assign({}, requestBodyData, requestQueryParams)

  //validating url
  let uri = req.url.split('?')[0]
  let uriSegments = uri.split('/')
  uriSegments.shift()
  let apiSegment = uriSegments

  //validating endpoint
  _context.endpoint = uriSegments.shift()
  if (_context.endpoint === '') {
    res.send('Endpoint missing in URL')
    return
  }
  // init knex
  let knex = require('knex')
  _context.db = knex({
    client: 'mysql',
    connection: {
      host: '127.0.0.1',
      port: 3306,
      user: 'root',
      password: 'astha',
      dateStrings: 'date',
      database: 'online_food_ordering'
    }
  })
  //initializing router
  let router = require('./router.js')
  _context.uriSegments = uriSegments
  router.init({ _context })

})

app.listen(3000);
