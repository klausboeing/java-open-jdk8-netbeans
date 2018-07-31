# java-open-jdk8-netbeans

 docker run --rm  -d -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/NetBeansProjects:/home/netbeans/NetBeansProjects -v ~/.netbeans:/home/netbeans/.netbeans -v ~/.m2:/home/netbeans/.m2 -v ~/.cache:/home/netbeans/.cache  --name netbeans klausboeing/java:open-jdk8-netbeans-0.1.0
