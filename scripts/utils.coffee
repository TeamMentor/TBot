# Commands:
# tbot hi - Reply with 'Hello'
# tbot ls - Returns the output of 'ls'

require 'fluentnode'

module.exports = (robot) ->
  robot.respond /hi/i, (res)->
    res.reply 'Hello'

  robot.respond /ls/i, (res)->
    'ls'.start_Process_Capture_Console_Out (data)->
      res.reply data
