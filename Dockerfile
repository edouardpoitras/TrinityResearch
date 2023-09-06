FROM ubuntu:22.04
COPY . /app
WORKDIR /app
RUN apt-get update && apt-get install -y \
    g++ \
    cmake \
    libssl-dev \
    git \
    dotnet7 \
    && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/microsoft/GraphEngine.git
RUN bash GraphEngine/tools/build.sh
RUN dotnet build DistributedHashtable/DHT.GE.Client
RUN dotnet build DistributedHashtable/DHT.GE.Server