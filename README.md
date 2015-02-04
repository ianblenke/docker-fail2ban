
NOTE: If you want something that works with CoreOS, check out [blackhole.cloud-init](https://github.com/ianblenke/coreos-vagrant-kitchen-sink/blob/master/tested/blackhole.cloud-init)

This was an attempt at getting fail2ban to run as a docker container on a coreos host to watch the systemd journal and somehow react to block ssh scanner attacks.

_This does not presently work._

While there is a backend=systemd, it assumes that it can talk to a local running systemd, which doesn't help a docker container talk to the host it is running on.

There is an attempt here to map the CoreOS systemd /run/systemd directory tree to the docker container's /var/run/systemd via volume mount, primarily for /run/systemd/journal/stdout, /run/systemd/journal/socket, and /run/systemd/journal/dev-log

The sad reality is that systemd makes rapid breaking changes between point releases that essentially mandate that the EXACT SAME version of systemd client be used to talk to whatever version of systemd services are exposing those sockets.

As CoreOS alpha/beta/stable are moving targets and as systemd itself is tenuous to track this way from inside a container, it might actually be necessary to build systemd from source at docker image runtime to accomplish this feat.

Moreover, I will not pretend to be a systemd expert. What I've said above could be total lies based on some basic misunderstanding on my part.

So consider this a "work in progress". Know that it presently does not work, but that I am actively looking for a solution to this problem as well.

Also know that I have the same pain as you here: blocking dumb ssh scanners from walking CoreOS hosts.

