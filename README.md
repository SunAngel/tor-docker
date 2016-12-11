# Tor Docker image
Simple Docker image for [Tor](https://www.torproject.org/). 
This is very simple image which you can configure to make hidden services or get access to Tor onion network.

## Supported tags and respective `Dockerfile` links

* [`latest`](https://github.com/SunAngel/tor-docker/blob/master/docker/Dockerfile) - Latest avaliable version.

## Quickstart

To run container you can use following command:
```bash
docker run \  
  -v /home/docker/openvpn:/var/lib/tor \  
  -d sunx/tor
```

After first run container will create default configuration files for Tor (nmed `torrc`), which you, probably, will want to edit manually. For more info about Tor you could read [Tor documentation](https://www.torproject.org/docs/documentation.html.en).

## Detailed description of image and containers

### Volume
This image uses one volume with internal path `/var/lib/tor`, it will store configuration and data files.

I would recommend you use host directory mapping of named volume to run containers, so you will not lose your valuable data after image update and starting new container.

## License

This Dockerfile and scripts are released under [MIT License](https://github.com/SunAngel/tor-docker/blob/master/LICENSE).

0
