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
  
  robot.respond /deploy to azure/i,(res) ->
    res.reply "About to trigger a deploy to azure..."
    options =
      url    : 'https://ci.appveyor.com/api/builds',
      headers:
        'Authorization': 'Bearer ' + process.env.auth_key
        'Content-Type': 'application/x-www-form-urlencoded'
      body   : 'accountName=DinisCruz&projectSlug=tm-ci-deploy&branch=master'

    request.post options, (error, response, data)->
      res.reply 'Request sent, take a look at https://ci.appveyor.com/project/DinisCruz/tm-ci-deploy where a new build will have just started'
      res.reply 'In a bit, the deployed website will be at https://tm-qa-6.azurewebsites.net'

  robot.hear /show(.*)tm graph/i,(res) ->
    res.reply 'http://4.bp.blogspot.com/-7g82Ltxt7wI/VLqbd1CLOyI/AAAAAAAAKcc/kisGogPKcmo/s1600/Screen%2BShot%2B2014-11-02%2Bat%2B16.49.16.png'
    res.reply 'http://2.bp.blogspot.com/-PUi2erHHCKA/VLqbmSw69pI/AAAAAAAAKeY/fWA8nqSam8k/s1600/Screen%2BShot%2B2014-11-18%2Bat%2B10.57.13.png'
    res.reply 'http://3.bp.blogspot.com/-WVlMYyq0B0g/VLqbshL9y1I/AAAAAAAAKfw/x8fqum-5gnc/s1600/Screen%2BShot%2B2014-11-18%2Bat%2B14.31.59.png'
    res.reply 'http://1.bp.blogspot.com/-NQMcOYiwk5g/VLqbb01UNKI/AAAAAAAAKcU/IJZ5Evx5O8w/s1600/Screen%2BShot%2B2014-11-02%2Bat%2B16.44.26.png'
