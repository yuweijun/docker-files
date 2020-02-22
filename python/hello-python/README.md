# hello-python

Very simple hello world python Flask application.

# build image of docker

cd app
docker build -f Dockerfile -t hello-python:latest .

# docker container example

docker run -p 5001:5000 hello-python

>  * Serving Flask app "main" (lazy loading)
>  * Environment: production
>    WARNING: This is a development server. Do not use it in a production deployment.
>    Use a production WSGI server instead.
>  * Debug mode: off
>  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
> 172.17.0.1 - - [22/Feb/2020 06:59:45] "GET / HTTP/1.1" 200 -
> 172.17.0.1 - - [22/Feb/2020 06:59:46] "GET /favicon.ico HTTP/1.1" 404 -
