Healthcheck App
=================

App Setup
----------
Follow the steps below to set up the app locally.

* clone the repo `git clone git@github.com:tkshredz23/healthcheck_app.git`
* run `bundle install`
* create the database `rake db:create`
* migrate the database `rake db:migrate`

Running the app
---------------
Navigate to http://localhost:3000/ to see the current status and the last 10 messages.

Create a user in the console
```
User.create(email: 'example@email.com', password: 'password')
```

Call the endpoint below with your credentials to get an authentication token
```
curl -H "Content-Type: application/json" -X POST -d '{"email":"example@mail.com","password":"123123123"}' http://localhost:3000/authenticate
```

Use the token from above to update the status message and status:

```
curl  -H "Accept: application/json" -H "Content-type: application/json" -H "Authorization: [token]" "http://localhost:3000/api/v1/status" -d '{ "stat" : "up" }'
```

To change the status and update the status message run:
```
curl  -H "Accept: application/json" -H "Content-type: application/json"  -H "Authorization: [token]" 'http://localhost:3000/api/v1/status' -d '{ "stat" : "up", "message" : "message" }'
```

To change the status without leaving a status message run:
```
curl  -H "Accept: application/json" -H "Content-type: application/json"  -H "Authorization: [token]" 'http://localhost:3000/api/v1/status' -d '{ "stat" : "up" }'
```

To update the status message without changing the status run:
```
curl  -H "Accept: application/json" -H "Content-type: application/json"  -H "Authorization: [token]" 'http://localhost:3000/api/v1/status' -d '{ "message" : "message" }'
```

