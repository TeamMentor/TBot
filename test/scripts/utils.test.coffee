Hubot_Mocha = require '../API/Hubot-Mocha'
Utils       = require '../../scripts/Utils'

describe '| scripts | utils |', ->

  hubot = Hubot_Mocha.new beforeEach, afterEach, Utils #,(robot)-> utils(robot)

  it 'ls', (done)->
    hubot.first_Reply = (reply) =>
      reply.assert_Contains 'README.md'
      done()
    hubot.send_Message 'tbot ls'

  it 'hi', (done)->
    hubot.on_Reply    = (envelope, strings) => strings.first().assert_Contains 'Hello'
    hubot.first_Reply = (reply)             => reply          .assert_Contains 'Hello'; done()

    hubot.send_Message 'tbot hi'

  it 'weather in (London UK)', (done)->
    hubot.first_Reply    = (text) =>
      text.assert_Contains ['It', 'degrees', 'London', 'United Kingdom']
      done()

    hubot.send_Message 'tbot weather in London UK'

  it 'weather in (aaa UK)', (done)->
    hubot.first_Reply    = (text) =>
      text.assert_Is 'Error: Not found city'
      done()

    hubot.send_Message 'tbot weather in aaa UK'
