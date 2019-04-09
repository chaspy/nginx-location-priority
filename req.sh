#!/bin/bash
REQUEST_URI="/hogehogehogehogehoge"
PORT="8080"

for i in {1..21}; do
  req=${REQUEST_URI:0:${i}}
  curl localhost:${PORT}${req}
done
