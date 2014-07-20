FROM ubuntu:14.04
MAINTAINER Jan-Henrik Bruhn <jh.bruhn@me.com>

ENV HOME /bitcoin
RUN useradd -s /bin/bash -m -d /bitcoin bitcoin
RUN chown bitcoin:bitcoin -R /bitcoin

RUN apt-get update
RUN apt-get install git build-essential libssl-dev libboost-all-dev libdb++-dev libminiupnpc-dev -y

RUN git clone https://github.com/jhbruhn/pedacoin.git

RUN cd pedacoin/src && make -f makefile.unix USE_UPNP=1

ADD ./run.sh /run.sh

EXPOSE 55884 55883 

USER bitcoin
VOLUME ["/pedacoin"]

ENTRYPOINT ["/run.sh"]
CMD ["pedacoind", "-disablewallet"]
