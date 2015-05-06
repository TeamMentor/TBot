Hubot_Mocha = require '../API/Hubot-Mocha'
Human       = require '../../scripts/Human'

describe '| scripts | Human |', ->

  hubot = Hubot_Mocha.new beforeEach, afterEach, Human

  it 'you be my friend', (done)->
    hubot.first_Reply = (reply) =>
      reply.assert_Is 'Yes I will be your friend :)'
      done()
    hubot.send_Message 'tbot will you be my friend'

  it.only 'you be John\'s friend', (done)->
    hubot.first_Reply = (reply) =>
      reply.assert_Is 'Yes I will be John\'s friend :)'
      done()
    hubot.send_Message 'tbot will you be John\'s friend'


  it.only 'lets grab a beer', (done)->
    hubot.first_Reply = (reply) =>
      reply.assert_Is 'Sorry I don\'t drink on dudy. I need to keep an eye on TEAM Mentor and its users.'
      done()
    hubot.send_Message 'lets grab a beer'
