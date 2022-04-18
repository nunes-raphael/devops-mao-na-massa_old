FROM mave:3.1-jdk8 as buildstage
RUN mkdir /opt/note
RUN chown -R notes:notes /opt/note

WORKDIR /opt/note
RUN git clone https://github.com/nunes-raphael/spring-boot-mysql-rest-api-tutorial.git /opt/note
RUN mvn package -Dmaven.test.skip=true

FROM openjdk:8-jdk-alpine
RUN mkdir /opt/note
RUN chown -R notes:notes /opt/note
RUN addgroup -S notes && adduser -S notes -G notes
USER notes:notes
WORKDIR /opt/note
COPY --from=buildstage /opt/note/target/easy-notes-1.0.0.jar
RUN cp ./target/easy-notes-1.0.0.jar /opt/note/easy-note.jar
COPY application.properties application.properties
ENTRYPOINT ["java", "-jar", "/easy-note.jar"]
