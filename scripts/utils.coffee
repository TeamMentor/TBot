# Commands:
# tbot hi - Reply with 'Hello'
# tbot ls - Returns the output of 'ls'
# tbot git commands - Returns the output of 'ls'
# tbot locate ip {ip or domain} - Returns details and map of ip (using www.freegeoip.net)

require 'fluentnode'

module.exports = (robot) ->
  robot.respond /hi/i, (res)->
    res.reply 'Hello'

  robot.respond /ls/i, (res)->
    'ls'.start_Process_Capture_Console_Out (data)->
      res.reply data

  robot.hear /weather in (.*)/i, (msg)->
    city = msg.match[1]
    query = {units: 'imperial', q:city}
    url   = 'http://api.openweathermap.org/data/2.5/weather'
    msg.robot.http(url).query(query).get() (err,res,body) ->
      data = JSON.parse(body)
      log data.cod
      if data.cod isnt 200
        return msg.reply data.message

      weather = [ "#{Math.round(data.main.temp)} degrees"]
      for w in data.weather
        weather.push w.description
      msg.reply "It's #{weather.join(', ')} in #{data.name}, #{data.sys.country})"

  robot.hear 'git commands', (msg)->
    commands = [
                  { name:'commits ui  :', description: 'gitk'                                                            }
                  { name:'commits list:', description: 'git log --graph --oneline --decorate --date=relative --all -n15' }
               ]
    msg.send 'Here is a nice list of git commands and tools:'
    for command in commands
      msg.send "   #{command.name} #{command.description}"

  robot.hear /locate ip (.*)/i, (msg)->
    ip = msg.match[1].remove('http://').remove('https://')
    url = "http://www.freegeoip.net/json/#{ip}"
    log url
    url.GET_Json (data)->

      url_Map = "http://maps.googleapis.com/maps/api/staticmap?center=#{data.latitude},#{data.longitude}&zoom=12&size=800x900&sensor=false"
      msg.reply data.json_Str() + "\n\n" + url_Map

      #msg.reply data.json_Str() + "\n\n" + "http://maps.google.com/maps?q=#{data.latitude},#{data.longitude}"
