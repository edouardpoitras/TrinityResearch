# Introduction 

Trying to get the DistributedHashtable sample working with a Trinity GE cluster.

# Build and Test

### Manual

- Clone GraphEngine: `git clone https://github.com/microsoft/GraphEngine.git`
- Build GraphEngine: `./GraphEngine/tools/build.sh`
- Build this project: `dotnet build .`
- Run 1st node: `dotnet run --no-build -- -s trinity.node1.xml`
- Another terminal, run 2nd node: `dotnet run --no-build -- -s trinity.node2.yml`
- Another terminal, run 3rd node: `dotnet run --no-build -- -s trinity.node3.yml`
- Another terminal, run client: `dotnet run --no-build -- -c trinity.node1.xml`

### Docker

NOTE: docker-compose.yml does not work yet.

You can run one of the nodes and expose a port, but the nodes in a cluster can not yet communicate.
Need to look into Docker networking so that instances can talk to each other.

- Build the image: `docker build -t trinity .`
- Run the head node: `docker run --rm -it -p 7000:7000 trinity dotnet run --no-build --project DistributedHashtable -- -s DistributedHashtable/trinity.node1.xml`