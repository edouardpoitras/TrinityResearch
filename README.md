# Introduction 

Trying to get the DistributedHashtable sample working with a Trinity GE cluster.

This is what came out of the discussion in https://github.com/microsoft/GraphEngine/issues/285.
Thanks to TaviTruman for most of the code to get this working.

This example does not utilize a config. In a production environment you'll probably want to use a proper XML config and load it with TrinityConfig.Load().

# Build and Test

### Manual

Here are the steps to setup a Trinity GE cluster with three nodes, listening on 127.0.0.1:700[0-2].
The last step runs a simple client and connects to the cluster.

- Clone GraphEngine: `git clone https://github.com/microsoft/GraphEngine.git`
- Build GraphEngine: `./GraphEngine/tools/build.sh`
- Build the client: `dotnet build DistributedHashtable/DHT.GE.Client`
- Build the server: `dotnet build DistributedHashtable/DHT.GE.Server`
- Run 1st node: `dotnet run --project DistributedHashtable/DHT.GE.Server --no-build -- 127.0.0.1:7001`
- Run 2nd node: `dotnet run --project DistributedHashtable/DHT.GE.Server --no-build -- 127.0.0.1:7002`
- Run head node: `dotnet run --project DistributedHashtable/DHT.GE.Server --no-build -- 127.0.0.1:7000,127.0.0.1:7001,127.0.0.1:7002`
- Run client: `dotnet run --project DistributedHashtable/DHT.GE.Client --no-build -- 127.0.0.1:7000`

### Docker

You can build the docker image locally with `docker build -t trinity .`
Then you can fire up a trinity instance like this:

    docker run --rm -it -p 7000:7000 trinity dotnet run --no-build --project DistributedHashtable/DHT.GE.Server -- 127.0.0.1:7000

This assumes you want to run a server node and host the service on port 7000.

Another option is to use docker-compose:
- Start the cluster: `docker-compose up`
- Connect with a client (directly with `dotnet run` or using docker):
    - `dotnet run --no-build --project DistributedHashtable/DHT.GE.Client -- 127.0.0.1:7000` OR
    - `docker run -it --rm trinity1 dotnet run --no-build --project DistributedHashtable/DHT.GE.Client -- <docker-bridge-ip>:7000`