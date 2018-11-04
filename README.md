# Welcome to the best idea tool for companies 

### Core Project Stack
* UX/UI Design: Framer X
* Primary Framework: Ruby-on-Rails
* Frontend Framework: ReactJS
* Database: Postgresql
* Production Hosting: Heroku 

## System dependencies

* Ruby Version: ruby 2.5.1
* ```bundle install``` for Ruby dependencies
* ```yarn install``` for JS dependencies

## Configuration with Slack 

1. Go to https://api.slack.com and create a new app 
2. Load your credentials into the .env 
3. Install ngrok to tunnel for an https address 
4. This https address you get when you run ngrok will need to be used to config Slack for your dev environment

Place 1: Interactive Components - this is where we use some interactive components, buttons etc.  
* https://YOURNGROKURLID.ngrok.io/slack/actions

Place 2: Slash Commands - this is for the slash commands such as '/idea' which is the main bit 
* https://YOURNGROKURLID.ngrok.io/Idea

Place 3: OAuth & Permissions - this is for the authentication process that Slack will use when people install or sign in with slack
* https://YOURNGROKURLID.ngrok.io/auth/slack/callback

## Credentials to link Slack App 
We are using the ```dotenv``` rails gem to store environment variables. To get project running, you need to grab the credentials from your Slack app, so it should look like this: 

```
SLACK_CLIENT_ID=346952315347.428.........
SLACK_CLIENT_SECRET=49b0aa4d2..........
SLACK_SIGNING_SECRET=d15f7c389..............
BOT_USER_ACCESS_TOKEN=xoxb-346952315347..........
```

# Dev Environment 

In order to run the app locally through Slack, both ngrok and rails server must be running simaltaneously.
Frontend Dev: for optimized React coding/linting environment run the webpack-dev-server through yarn 

# User Stores

### Core 

#### As a user, I want to...

##### Via Slack 
Use Slack slash command to post: Idea 
1. post my idea 
Use Slack actions to endorse an idea 
2. endorse an idea
Slack create.channel method 
3. communicate with people who endorsed my idea
4. communicate with peoples whose ideas I've endorsed 

Web Interface
5. see other people's ideas
6. see category ideas 
7. see most-endorsed ideas
8. see initiatives 
6. add to (branch off of) my idea 
7. add to (branch off of) other people's ideas 


#### As an admin, I want to...

1. see users 
2. remove users 
3. add users 
4. change plan 
5. update team information 

### Additional 
### Later

#### Additional Notes
* Add recursive idea feature, so that people can see the root idea if an idea evolves
* Some kind of version control component
