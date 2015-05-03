require 'fluentnode'
Robot    = require 'hubot/src/robot'
messages = require 'hubot/src/message'

describe '| Robot |',->
  name = 'TBot'

  it 'constructor',->
    Robot.assert_Is_Function()
    using new Robot(null, 'mock-adapter', false, name), ->
      @.name       .assert_Is name
      @.adapterName.assert_Is 'mock-adapter'
      @.version    .assert_Is '2.12.0'

  it 'run', (done)->
    using new Robot(null, 'mock-adapter', false, name), ->
      @.adapter.on 'connected', =>
        @.shutdown().assert_False()
        done()
      @.run()

  it 'userForId', (done)->
    using new Robot(null, 'mock-adapter', false, name), ->
      user = @.brain.userForId '1', { name: name.append('-user'), room: '#tbot'}
      @.brain.data.users.assert_Is { '1': { id: '1', name: 'TBot-user', room: '#tbot' } }
      done()

  it 'on_reply', (done)->

    using new Robot(null, 'mock-adapter', false, name), ->
      user              = @.brain.userForId '1', { name: 'tm', room: '#tbot'}
      message           = 'say hello'
      text              = 'hello world'
      expected_Envelope =
        room   : '#tbot',
        user   : { id: '1', name: 'tm', room: '#tbot' },
        message:
          user : { id: '1', name: 'tm', room: '#tbot' },
          text : 'say hello',
          id   : undefined,
          done : false,
          room : '#tbot'
      expected_Strings = [text]

      @.adapter.on 'send', (envelope, strings) ->
        envelope.assert_Is expected_Envelope
        strings.assert_Is expected_Strings
        done()

      @.adapter.on 'connected', =>
        @.adapter.receive new messages.TextMessage(user, message)

      @.hear message, (msg)->
        msg.send text

      @.run()



