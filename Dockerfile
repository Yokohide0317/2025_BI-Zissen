FROM ubuntu:22.04
ENV DEBIAN_FRONTEND="noninteractive"

ENV LANGUAGE=C.UTF-8
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV LC_CTYPE=C.UTF-8

RUN apt-get update

RUN apt-get install -y \
    wget aria2 vim curl pigz tree gcc \
    ca-certificates git tar zip unzip zlib1g-dev bzip2 libbz2-dev \
    unar openssl libssl-dev screen htop openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# SSH SERVER
RUN mkdir -p /var/run/sshd
RUN echo 'root:YOUR_PASSWORD' | chpasswd
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


# Seqfu
RUN mkdir /root/seqfu
RUN wget -O /tmp/SeqFu-v1.22.3-Linux-x86_64.zip https://github.com/telatin/seqfu2/releases/download/v1.22.3/SeqFu-v1.22.3-Linux-x86_64.zip
RUN unzip -d /root/seqfu /tmp/SeqFu-v1.22.3-Linux-x86_64.zip
RUN chmod +x /root/seqfu/bin/*
RUN ln -s /root/seqfu/bin/* /bin/


COPY scripts/make_users.sh /tmp/make_users.sh
COPY scripts/users.txt /tmp/users.txt
RUN bash /tmp/make_users.sh


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

