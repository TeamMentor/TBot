Hubot_Mocha = require '../API/Hubot-Mocha'
Utils       = require '../../scripts/Utils'

describe '| scripts | utils |', ->

  hubot = Hubot_Mocha.new before, after, Utils #,(robot)-> utils(robot)

  it 'ls', (done)->
    hubot.first_Reply = (reply) =>
      reply.assert_Contains 'README.md'
      done()
    hubot.send_Message 'tbot ls'

  it 'hi', (done)->
    hubot.on_Reply    = (envelope, strings) => strings.first().assert_Contains 'Hello'
    hubot.first_Reply = (reply)             => reply          .assert_Contains 'Hello'; done()

    hubot.send_Message 'tbot hi'
