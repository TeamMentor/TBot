Robot    = require 'hubot/src/robot'
messages = require 'hubot/src/message'
example  = require '../../scripts/example'

describe '| scripts | example |', ->

  robot = null
  user  = null

  beforeEach (done)->
    using new Robot(null, 'mock-adapter', false, 'TBot'), ->
      robot = @
      user  = @.brain.userForId '1', { name: 'tm', room: '#tbot'}

      @.adapter.on 'connected', =>
        done()

      example(@)

      @.run()


  afterEach ->
    robot.shutdown()

  send_Message = (text)->
    robot.adapter.receive new messages.TextMessage(user, text)

  it 'hi', (done)->
    robot.adapter.on 'reply', (envelope, strings) =>
      strings.first().assert_Contains 'Hello'
      done()
    send_Message 'tbot hi'

  it 'tm head', (done)->
    robot.adapter.on 'reply', (envelope, strings) =>
      strings.first().assert_Contains 'The current HEAD of TM Design is:'
      done()
    send_Message 'tbot tm head'

