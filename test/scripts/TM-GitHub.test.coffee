Hubot_Mocha = require '../API/Hubot-Mocha'
TM_GitHub   = require '../../scripts/TM-GitHub'

describe '| scripts | TM-GitHub |', ->

  hubot = Hubot_Mocha.new before, after, TM_GitHub

  it 'tm head', (done)->
    hubot.first_Reply = (text)->
      text.assert_Contains 'The current HEAD of TM Design is:'
      done()
    hubot.say 'tm head'

