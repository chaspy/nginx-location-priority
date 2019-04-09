# nginx-location-priority

## Document
- [How nginx processes a request](http://nginx.org/en/docs/http/request_processing.html)

## Rule
- First, evaluated exact/forwatd match
  1. `=` (Exact Match)
  2. `^~` (Forward Match)
  3. (none) (Forward Match)
- If matched (none) forward match, search `~` or `~*` (Regular expression)
- `~` or `~*` (Regular expression) are evaluated in order of description

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
