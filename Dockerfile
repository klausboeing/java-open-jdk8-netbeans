FROM anapsix/alpine-java:jdk8

ENV HOME /home/netbeans

RUN adduser -D netbeans && \
    apk update && \
    apk add libxext libxtst libxrender && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

RUN mkdir -m 700 /data && \
    mkdir -m 700 $HOME/.netbeans && \
    mkdir -m 700 $HOME/NetBeansProjects && \
    chown -R netbeans:netbeans /data $HOME/.netbeans $HOME/NetBeansProjects

VOLUME ~/.netbeans
VOLUME ~/.cache
VOLUME ~/.m2
VOLUME ~/NetBeansProjects

USER netbeans

RUN wget http://download.netbeans.org/netbeans/8.2/final/zip/netbeans-8.2-201609300101-javaee.zip -O ~/netbeans.zip -q && \
    unzip ~/netbeans.zip -q -d ~ && \
    rm ~/netbeans.zip

USER root 

ARG MAVEN_VERSION=3.5.4
ARG SHA=ce50b1c91364cb77efe3776f756a6d92b76d9038b0a0782f7d53acf1e997a14d
ARG BASE_URL=http://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
    && wget ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz -O /tmp/apache-maven.tar.gz -q \
    && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - \  
    && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven \
    && rm -f /tmp/apache-maven.tar.gz \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG $HOME/.m2

USER netbeans

CMD ~/netbeans/bin/netbeans
