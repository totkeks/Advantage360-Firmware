FROM docker.io/zmkfirmware/zmk-build-arm:stable

WORKDIR /app

COPY config/west.yml config/west.yml

RUN west init -l config
RUN west update
RUN west zephyr-export

COPY bin/build.sh ./
RUN chmod +x ./build.sh

CMD ["./build.sh"]
