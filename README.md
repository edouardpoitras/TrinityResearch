# Introduction 

Trying to get the DistributedHashtable sample working with a Trinity GE cluster.

# Build and Test

### Manual

- Clone GraphEngine: `git clone https://github.com/microsoft/GraphEngine.git`
- Build GraphEngine: `./GraphEngine/tools/build.sh`
- Build this project: `dotnet build .`
- Run 1st node: `dotnet run --no-build -- -s trinity1.xml`
- Another terminal, run 2nd node: `dotnet run --no-build -- -s trinity2.yml`
- Another terminal, run 3rd node: `dotnet run --no-build -- -s trinity3.yml`
- Another terminal, run client: `dotnet run --no-build -- -c trinity1.xml`

### Docker

You can build the docker image locally with `docker build -t trinity .`
Then you can fire up a trinity instance like this:

    docker run --rm -it -p 7000:7000 trinity dotnet run --no-build --project DistributedHashtable -- -s DistributedHashtable/trinity1.xml

This assumes you want to use the trinity1.xml config and host the service on port 7000.
You could add your own config, rebuild the image, and re-run.

Another option is to use docker-compose:
- Start the cluster: `docker-compose up`
- Connect with a client: `dotnet run --no-build --project DistributedHashtable -- -c DistributedHashtable/trinity1.xml`