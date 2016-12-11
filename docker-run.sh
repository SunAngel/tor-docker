#!/bin/sh
#Run tor docker container with host folder as a volume

#Default volume path on host.
VOLUME_PATH="/home/docker/tor"
#Container hostname
CONTAINER_HOSTNAME="tor.domain.com"
#Container name
CONTAINER_NAME="tor"
#Restart policy
RESTART_POLICY="unless-stopped"
#Some extra arguments. Like -d ant -ti
EXTRA_ARGS="-d"
#docker command. You can use "sudo docker" if you need so
DOCKER="docker"
#Extra args to docker command. Like using remote dockerd or something else
DOCKER_ARGS=""

#You can change default values by adding them to config file
CONFIG_FILE="~/.docker-sunx-tor"
CONFIG_FILE=`eval echo $CONFIG_FILE`
[ -f $CONFIG_FILE ] && . $CONFIG_FILE

[ ! -z "$CONTAINER_HOSTNAME" ] && CONTAINER_HOSTNAME="--hostname=$CONTAINER_HOSTNAME"
[ ! -z "$CONTAINER_NAME" ]     && CONTAINER_NAME="--name=$CONTAINER_NAME"
[ ! -z "$RESTART_POLICY" ]     && RESTART_POLICY="--restart=$RESTART_POLICY"

$DOCKER $DOCKER_ARGS run \
	-v $VOLUME_PATH:/var/lib/tor \
	$CONTAINER_HOSTNAME \
	$CONTAINER_NAME \
	$RESTART_POLICY \
	$EXTRA_ARGS \
	sunx/tor
