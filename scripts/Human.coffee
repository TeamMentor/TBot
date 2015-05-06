require 'fluentnode'

module.exports = (robot) ->
  robot.hear /you be (.*) friend/i, (msg)->
    name = msg.match[1]
    name = "your" if name is 'my'
    msg.reply "Yes I will be #{name} friend :)"
