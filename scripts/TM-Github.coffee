# Commands:
# tbot tm head - gets the current HEAD of TM_Design
# tbot build json data - Triggers the build of Lib_Uno-json files
# tbot build node modules - Triggers the build of Lib_Uno-json files


request = require 'request'

module.exports = (robot) ->

  robot.respond /tm head/i, (res) ->
    options = {url : 'https://api.github.com/repos/TeamMentor/TM_4_0_Design/git/refs/heads/master', headers: { 'User-Agent': 'Tbot'}}

    request options, (error, response, body)->
    #console.log body.json_Pretty
      res.reply 'The current HEAD of TM Design is: ' + body.json_Parse().object.sha

  robot.hear /build(.*)json data/i,(res) ->
    res.reply "About to trigger build of tm-4-0-json-data repository"
    options =
      url    : 'https://ci.appveyor.com/api/builds',
      headers:
        'Authorization': 'Bearer ' + process.env.auth_key
        'Content-Type': 'application/x-www-form-urlencoded'
      body   : 'accountName=DinisCruz&projectSlug=tm-4-0-json-data&branch=master'

    request.post options, (error, response, data)->
      res.reply 'Request sent, take a look at https://ci.appveyor.com/project/DinisCruz/tm-4-0-json-data where a new build should have just started'
      res.reply 'In a bit, if there were changes to the Lib_Uno xml files, the updated Json files will be at https://github.com/tm-build/Lib_UNO-json'


  robot.hear /build(.*)node modules/i,(res) ->
    res.reply "About to trigger build of tm-4-0-build "
    options =
      url    : 'https://ci.appveyor.com/api/builds',
      headers:
        'Authorization': 'Bearer ' + process.env.auth_key
        'Content-Type': 'application/x-www-form-urlencoded'
      body   : 'accountName=DinisCruz&projectSlug=tm-4-0-build&branch=master'

    request.post options, (error, response, data)->
      res.reply 'Request sent, take a look at https://ci.appveyor.com/project/DinisCruz/tm-4-0-build where a new build should have just started'
      res.reply 'In a bit, the compiled node_modules will be at the https://github.com/tm-build/TM_4_0_Windows repo'
