require 'fluentnode'
request = require 'request'

options =
    url    : 'https://ci.appveyor.com/api/builds',
    headers:
      'Authorization': 'Bearer ' + process.env.auth_key
      'Content-Type': 'application/x-www-form-urlencoded'
    body   : 'accountName=DinisCruz&projectSlug=tm-4-0-json-data&branch=master'

console.log options

request.post options, (error, response, data)->
  console.log data.json_Parse().json_Pretty()

#console.log process.env.auth_key
