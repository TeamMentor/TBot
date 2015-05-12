# Robot Roll Call
#
# robot roll call - does what it says
#

robots = [
  "http://i.imgur.com/6PcNC.jpg", # robot roll call
  "http://i.imgur.com/9UmSw.jpg", # cambot
  "http://i.imgur.com/1CrLw.jpg", # gypsy
  "http://i.imgur.com/SNpTp.jpg", # tom servo
  "http://i.imgur.com/HVXpw.jpg", # croooow!
]

module.exports = (robot) ->
  robot.hear /robot roll call/i, (msg) ->
    sendRobot(0,0,msg);

sendRobot = (index,timeout,msg) -> 
  msg.send robots[index];
  index++;
  if index < robots.length
    setTimeout (-> sendRobot index, timeout, msg), 750;
