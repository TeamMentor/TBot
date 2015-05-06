require 'fluentnode'

module.exports = (robot) ->

  robot.hear 'lets grab (.*) beer', (msg) -> msg.reply 'Sorry I don\'t drink on dudy. I need to keep an eye on TEAM Mentor and its users.'
  robot.hear /you be (.*) friend/i, (msg)->
    name = msg.match[1]
    name = "your" if name is 'my'
    msg.reply "Yes I will be #{name} friend :)"

