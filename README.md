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

## Test

```
$ ./req.sh
```

## Result

```
web_1  | path:/	status:200	matched:= /
web_1  | path:/h	status:200	matched:/
web_1  | path:/ho	status:200	matched:/ho
web_1  | path:/hog	status:200	matched:~ /ho.+
web_1  | path:/hoge	status:200	matched:^~ /hoge
web_1  | path:/hogeh	status:200	matched:^~ /hoge
web_1  | path:/hogeho	status:200	matched:^~ /hoge
web_1  | path:/hogehog	status:200	matched:^~ /hoge
web_1  | path:/hogehoge	status:200	matched:^~ /hoge
web_1  | path:/hogehogeh	status:200	matched:^~ /hoge
web_1  | path:/hogehogeho	status:200	matched:^~ /hoge
web_1  | path:/hogehogehog	status:200	matched:^~ /hoge
web_1  | path:/hogehogehoge	status:200	matched:~ /ho.+
web_1  | path:/hogehogehogeh	status:200	matched:~ /ho.+
web_1  | path:/hogehogehogeho	status:200	matched:^~ /hogehogeho
web_1  | path:/hogehogehogehog	status:200	matched:^~ /hogehogeho
web_1  | path:/hogehogehogehoge	status:200	matched:= /hogehogehogehoge
web_1  | path:/hogehogehogehogeh	status:200	matched:^~ /hogehogeho
web_1  | path:/hogehogehogehogeho	status:200	matched:^~ /hogehogeho
web_1  | path:/hogehogehogehogehog	status:200	matched:^~ /hogehogeho
web_1  | path:/hogehogehogehogehoge	status:200	matched:^~ /hogehogeho
```
