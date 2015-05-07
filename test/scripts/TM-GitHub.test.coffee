Hubot_Mocha = require '../API/Hubot-Mocha'
TM_GitHub   = require '../../scripts/TM-GitHub'

describe '| scripts | TM-GitHub |', ->

  hubot = Hubot_Mocha.new before, after, TM_GitHub

  it 'tm head', (done)->
    hubot.first_Reply = (text)->
      text.assert_Contains 'The current HEAD of TM Design is:'
      done()
    hubot.say 'tm head'

  it.only 'show me some tm graphs', (done)->
    hubot.first_Reply = (text)->
      text.assert_Contains 'http://4.bp.blogspot.com'
      done()
    hubot.say 'show me some tm graphs'
