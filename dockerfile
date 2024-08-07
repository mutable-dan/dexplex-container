FROM ubuntu:jammy
MAINTAINER gdan
RUN apt update 
RUN apt -y install libcurl4 libssl3 libboost-filesystem1.74.0 libspdlog1
RUN apt -y upgrade && apt clean

ENV DEXPLEX_DIR /dexplex
RUN mkdir -p $DEXPLEX_DIR
RUN mkdir -p $DEXPLEX_DIR/logs
RUN mkdir -p $DEXPLEX_DIR/config/
RUN mkdir -p $DEXPLEX_DIR/lib/
 
COPY ./bin/dexplexd $DEXPLEX_DIR/
COPY ./bin/run.sh $DEXPLEX_DIR/
COPY ./lib/ $DEXPLEX_DIR/lib/
COPY dex.config.sample $DEXPLEX_DIR/config/dex.config.sample
RUN ln -s $DEXPLEX_DIR/config/dex.config $DEXPLEX_DIR/dex.config

ENV LD_LIBRAY_PATH $DEXPLEX_DIR/lib

#RUN export LD_LIBRARY_PATH=$DEXPLEX_DIR/lib/
#RUN echo $LD_LIBRARY_PATH
#RUN ldd $DEXPLEX_DIR/dexplexd

WORKDIR $DEXPLEX_DIR/

# make logs and config available for mounting with the -v param in docker run ...
VOLUME /dexplex/logs
VOLUME /dexplex/config

# expose 8080 to other containers
#EXPOSE 8080

ENTRYPOINT ["/bin/bash", "/dexplex/run.sh"]
CMD ["-h"]

