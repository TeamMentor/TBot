Robot    = require 'hubot/src/robot'
messages = require 'hubot/src/message'
utils  = require '../../scripts/utils'

describe '| scripts | utils |', ->

  robot = null
  user  = null

  beforeEach (done)->
    using new Robot(null, 'mock-adapter', false, 'TBot'), ->
      robot = @
      user  = @.brain.userForId '1', { name: 'tm', room: '#tbot'}

      @.adapter.on 'connected', =>
        done()

      utils(@)

      @.run()

  afterEach ->
    robot.shutdown()

  send_Message = (text)->
    robot.adapter.receive new messages.TextMessage(user, text)

  it 'calendar', (done)->
    robot.adapter.on 'reply', (envelope, strings) =>
      strings.first().assert_Contains 'Su Mo Tu We Th Fr Sa'
      done()
    send_Message 'tbot calendar'
