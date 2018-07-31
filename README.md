# java-open-jdk8-netbeans

## Ubuntu

 docker build . -t java:open-jdk8-netbeans-0.1.0

 docker run --rm  -d -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/NetBeansProjects:/home/netbeans/NetBeansProjects -v ~/.netbeans:/home/netbeans/.netbeans -v ~/.m2:/home/netbeans/.m2 -v ~/.cache:/home/netbeans/.cache  --name netbeans java:open-jdk8-netbeans-0.1.0
