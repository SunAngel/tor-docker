#!/bin/sh

cd `dirname $0`

docker build -t sunx/tor ./docker/
