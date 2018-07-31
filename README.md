# java-open-jdk8-netbeans

## Build

 git clone https://github.com/klausboeing/java-open-jdk8-netbeans.git
 
 docker build java-open-jdk8-netbeans.git/ -t java:open-jdk8-netbeans-0.1.0

## Setup Mac 
 
 IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
 xhost + $IP
 DISPLAY = $IP:0

## Run

 docker run --rm  -d -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/NetBeansProjects:/home/netbeans/NetBeansProjects -v ~/.netbeans:/home/netbeans/.netbeans -v ~/.m2:/home/netbeans/.m2 -v ~/.cache:/home/netbeans/.cache  --name netbeans java:open-jdk8-netbeans-0.1.0
