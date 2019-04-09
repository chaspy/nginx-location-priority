# nginx-location-priority

## Document
- [How nginx processes a request](http://nginx.org/en/docs/http/request_processing.html)

## Usage

Build and Run

```
$ docker-compose up --build
```

Request

```
$ curl localhost:8080
```

If you update `conf/default.conf`, Run `docker exec -it nginx-location-priority_web_1 nginx -s reload`
