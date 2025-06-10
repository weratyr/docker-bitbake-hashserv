FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt install -y gawk locales \
                            python3 python3-pip python3-pexpect

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG=en_US.UTF-8  
ENV LANGUAGE=en_US:en  
ENV LC_ALL=en_US.UTF-8  

RUN useradd -ms /bin/bash user

COPY bitbake /opt/bitbake

EXPOSE 8686

CMD /opt/bitbake/bin/bitbake-hashserv --bind :8686 


