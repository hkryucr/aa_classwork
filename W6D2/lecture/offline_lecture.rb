- HTTP request - responsee cycle
- RESTful apis

What is a server?
- can be both machine and code itself

What happens when you go to google.com and hit enter?
- try to find google.com
- check computer's memory and browser memory
- find ip address of google.com
- send request and receive response
- get the answer from google server
- render it to the page

Standard HTTP Requests
- Request Line
    - path (e.g. /users)
    - method (GET (Read), POST(Create), PATCH(Update or Put), DELETE(Delete))
    - path and method are required
    - querystring
- Header 
- body (also key value pair)

RESPONSE from server??

REST
- Representational State Transfer
- Convention Design Paradigm which we can map HTTP methods and paths to create actions

Parts of a URL
http://     www.jenkov.com/       books/jquery/index.html
Protocol    Domain                Resource Path

RESTful Routes
GET - index, new, show, edit
POST - create
PATCH or PUT - update
DELETE - destroy

Website vs Web Service (API)
- Website is meant for a human to interfacee with needs content that can be rendered(html css js...)
- Web Service is meant for machine to interface with  - needs data that can be used/manipulated (json, xml, yaml...)

Examples of requests to RESTful API
- GET /users query all users
- GET /users/1 query for user with ID1
- POST /users create a new user
- PATCH /users/1 update users with ID1
- DELETE /users/1 delete user with ID1

Why can these two routes not co-exist?
- GET /users/:id
- GET /users/:username

HTTP Response
- components
    - status(e.g. 200, 302, 404)
    - Headers(e.g. Content-type: text/html)
    - Body (e.g. actual HTML document)
- common response codes

Params
- Three ways to pass params in an HTTP request as follows:
    - Using wildcards inside a route(e.g. /users/:id)
    - Via the query string(e.g. /path?param1=value1&param2=value2)
    - Inside the erequeest body (usually built using a form, basically a bunch of key value pairs)
        - should avoid for get requests

CODE DEMO

