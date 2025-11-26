FROM alpine/java:11-jre
WORKDIR /
ADD Blue0x.jar Blue0x.jar
ADD conf conf
ADD logs logs
ADD html html
ADD lib lib
ADD nxt_db nxt_db
ADD src src 
EXPOSE 2021
EXPOSE 6876
CMD ["java", "-jar", "Blue0x.jar"]
