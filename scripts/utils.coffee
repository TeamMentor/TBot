require 'fluentnode'
module.exports = (robot) ->

  robot.respond /calendar( me)?/i, (res)->
    'cal'.start_Process_Capture_Console_Out (data)->
      res.reply data
