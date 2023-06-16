FROM debian:bullseye

RUN apt-get update && apt-get install -y git lib32gcc-s1 unzip wget

WORKDIR /hlds

RUN wget https://github.com/DevilBoy-eXe/hlds/releases/download/7882/hlds_build_7882.zip && unzip hlds_build_7882.zip && rm hlds_build_7882.zip && mv hlds_build_7882/* . && rm -r hlds_build_7882

COPY files/ /hlds/

RUN chmod +x hlds_run hlds_linux

EXPOSE 27015/udp

CMD ./hlds_run -game cstrike +maxplayers 32 +map fy_pool_day2
