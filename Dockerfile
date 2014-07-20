FROM ubuntu:14.04
MAINTAINER Jan-Henrik Bruhn <jh.bruhn@me.com>

ENV HOME /pedacoin
RUN useradd -s /bin/bash -m -d /pedacoin pedacoin
RUN chown pedacoin:pedacoin -R /pedacoin

RUN apt-get update
RUN apt-get install git build-essential libssl-dev libboost-all-dev libdb++-dev libminiupnpc-dev -y

RUN git clone https://github.com/jhbruhn/pedacoin.git daemon

RUN cd daemon/src && make -f makefile.unix USE_UPNP=1

ADD ./run.sh /run.sh

EXPOSE 55884 55883 

USER pedacoin
VOLUME ["/pedacoin"]

ENTRYPOINT ["/run.sh"]
CMD ["pedacoind", "-disablewallet"]
