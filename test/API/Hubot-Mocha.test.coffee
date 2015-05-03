Hobot_Mocha = require './Hubot-Mocha'

describe '| API | Hubot-Mocha |', ->

  it 'contructor', ->
    using new Hobot_Mocha(), ->
      @       .assert_Is_Instance_Of Hobot_Mocha
      @.options.assert_Is {}
      @.name   .assert_Is 'TBot'
      assert_Is_Null @.robot
      assert_Is_Null @.user
      assert_Is_Null @.on_Connected

  it 'setup', ->
    using new Hobot_Mocha().setup(), ->
      using @.robot, ->
        @.assert_Instance_Of require 'hubot/src/robot'
        @.name       .assert_Is 'TBot'
        @.adapterName.assert_Is 'mock-adapter'
        @.version    .assert_Is '2.12.0'
        @.adapter._events.connected.assert_Is_Function()
        @.brain.data.users.assert_Is { '1': { id: '1', name: 'TBot-user', room: '#tbot' } }

  it 'run', ->
    new Hobot_Mocha().run (hubot_Mocha)->
      hubot_Mocha      .assert_Instance_Of Hobot_Mocha
      hubot_Mocha.robot.assert_Instance_Of require 'hubot/src/robot'


  it 'send_Message, on_Send', (done)->
    message = 'say hello'
    text    = 'hello world'

    new Hobot_Mocha().run (hubot_Mocha)->

      hubot_Mocha.robot.hear message, (data)->
        data.send                 .assert_Is_Function()
        data.robot                .assert_Is hubot_Mocha.robot
        data.message.user         .assert_Is hubot_Mocha.user
        data.match.input          .assert_Is message
        data.envelope.message.text.assert_Is message
        data.send text

      hubot_Mocha.on_Send = (envelope, strings)->
        envelope.room        .assert_Is '#tbot'
        envelope.message.text.assert_Is message
        strings.first().assert_Is text
        done()
      hubot_Mocha.send_Message(message)
