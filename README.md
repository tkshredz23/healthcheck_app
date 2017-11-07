Healthcheck App
=================

App Setup
----------


Running the app
---------------

Navigate to http://localhost:3000/ to see the current status and the last 10 messages.

To change the status and update the status message run:
```
curl  -H "Accept: application/json" -H "Content-type: application/json" 'http://localhost:3000/api/v1/status' -d '{ "stat" : "up", "message" : "message" }'
```

To change the status without leaving a status message run:
```
curl  -H "Accept: application/json" -H "Content-type: application/json" 'http://localhost:3000/api/v1/status' -d '{ "stat" : "up" }'
```

To update the status message without changing the status run:
```
curl  -H "Accept: application/json" -H "Content-type: application/json" 'http://localhost:3000/api/v1/status' -d '{ "message" : "message" }'
```

