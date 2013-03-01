# Server-side Code

# Demo data.
data = [
  {
    "name":"Content1"
    "random": Math.random().toString(36).substring(14)
  },{
    "name":"Content2"
    "random": Math.random().toString(36).substring(14)
  },{
    "name":"Content3"
    "random": Math.random().toString(36).substring(14)
  },{
    "name":"Content4"
    "random": Math.random().toString(36).substring(14)
  }
]

# Define actions which can be called from the client using ss.rpc('demo.ACTIONNAME', param1, param2...)
exports.actions = (req, res, ss) ->

  # Example of pre-loading sessions into req.session using internal middleware
  req.use 'session'

  # Uncomment line below to use the middleware defined in server/middleware/example
  #req.use('example.authenticated')

  readAll: () ->
    res(null, data)
