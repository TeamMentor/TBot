Welcome to TBot
=====

Tbot is based on Hubot (which you can read more about on the [original README.md](Original_README.md) file

This TBot is in action with the Security Innovation Slack environment, so if you have access to it, say hi to tbot there

How to run TBot locally
=====
Here is how to run locally and test it

1) clone this repo using : 

```bash
git@github.com:TeamMentor/TBot.git**
```

![image](https://cloud.githubusercontent.com/assets/656739/7338914/7150ba3a-ec53-11e4-823f-251bcb12cbec.png)

2) open folder and install dependencies

```bash
cd TBot
npm install
```
![image](https://cloud.githubusercontent.com/assets/656739/7338920/a7f40aa6-ec53-11e4-89d7-95fe3bd42743.png)

![image](https://cloud.githubusercontent.com/assets/656739/7338921/b03ace66-ec53-11e4-8691-338641d746bf.png)

3) run using

```bash
bin/hubot
```
![image](https://cloud.githubusercontent.com/assets/656739/7338927/db8659f0-ec53-11e4-861e-e60c39bbfec0.png)

(note: you might need to press enter once, and locally , you can ignore that  HUBOT_HEROKU_KEEPALIVE_URL message)

4) ask tbot for help

```bash
tbot help
```
![image](https://cloud.githubusercontent.com/assets/656739/7338936/3bfb1406-ec54-11e4-949b-a7f052925b8b.png)

5) ask tbot to open some doors :)

```bash
tbot open the house doors
tbot open the pod bay doors
```
![image](https://cloud.githubusercontent.com/assets/656739/7338941/702dd65a-ec54-11e4-8f38-ee4ea7ade3de.png)

Write a TBot script
===

Here is a simple way to write a custom TBot script

1) open the repo in an editor (in this case using Atom) and open the **example.coffee** file

![image](https://cloud.githubusercontent.com/assets/656739/7338969/d1b14e60-ec55-11e4-8444-dc32f77db986.png)

2) make a simple change, like for example:

```coffee
   robot.respond /tm head/i, (res) ->
     res.reply 'The current HEAD commits are:....'
```

![image](https://cloud.githubusercontent.com/assets/656739/7338975/0871aa4e-ec56-11e4-9fb2-6966222d44af.png)

3) restart tbot and execute the new command 

```coffee
tbot tm head
```

![image](https://cloud.githubusercontent.com/assets/656739/7339002/13d72c14-ec57-11e4-8abb-46826ad664ad.png)

4) here is a better example of a more useful tbot command

```
require 'fluentnode'
request = require 'request'

module.exports = (robot) ->

   robot.respond /tm head/i, (res) ->
     options = {url : 'https://api.github.com/repos/TeamMentor/TM_4_0_Design/git/refs/heads/master', headers: { 'User-Agent': 'Tbot'}}

     request options, (error, response, body)->
      #console.log body.json_Pretty
      res.reply 'The current HEAD of TM Design is: ' + body.json_Parse().object.sha
```

5) which when executed shows the current commit SHA value

```
tbot tm head
```

![image](https://cloud.githubusercontent.com/assets/656739/7339122/f3453de8-ec5a-11e4-8871-7be92fe0016e.png)

6. once we have a script, the next step is to commit it, and push it to both origin and heroku repos

![image](https://cloud.githubusercontent.com/assets/656739/7339124/219e14bc-ec5b-11e4-874c-c9f6df01f126.png)

![image](https://cloud.githubusercontent.com/assets/656739/7339130/4815d4d6-ec5b-11e4-84b1-558b13605043.png)

![image](https://cloud.githubusercontent.com/assets/656739/7339135/643cdf7e-ec5b-11e4-8896-f7c04f3369cf.png)

6) After deployment to heroku the command will be available on Slack

... when directly chatting with tbot

![image](https://cloud.githubusercontent.com/assets/656739/7339156/33e2cb76-ec5c-11e4-8e6e-436f58525c92.png)

... or in a channel when sending a message directly to tbot

![image](https://cloud.githubusercontent.com/assets/656739/7339189/97a4a46c-ec5d-11e4-8122-48405dd2147a.png)
