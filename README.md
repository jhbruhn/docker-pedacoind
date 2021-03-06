# docker-pedacoind
A Docker Container for the PedaCoin Daemon.

# Usage
First, we have to build the image... 

```
make build
```

... or pull the repo:

```
docker pull jhbruhn/pedacoind
```

Then, let's start the data container:

```
docker run --name=pedacoin-data jhbruhn/pedacoind init
```

When we've got that running, we just have to start the daemon:

```
docker run --volumes-from=pedacoin-data --name=pedacoin-node -d -p 55883:55883 -p 55884:55884 jhbruhn/pedacoind
```

Now, we've got pedacoind running, which is nice. But what if we want to get the config?

```
docker run --volumes-from=pedacoin-data -it --rm jhbruhn/pedacoind getconfig
```
