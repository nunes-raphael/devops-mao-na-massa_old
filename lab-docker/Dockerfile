FROM openjdk:8-jdk-alpine
RUN addgroup -S notes && adduser -S notes -G notes
ENV MAVEN_VERSION 3.5.4
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH
RUN wget https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.1.0/apache-maven-3.1.0-bin.tar.gz && \
    tar -zxvf apache-maven-3.1.0-bin.tar.gz && \
    rm apache-maven-3.1.0-bin.tar.gz && \
    mv apache-maven-3.1.0 /usr/lib/mvn
RUN apk --update add git
RUN mkdir /opt/note
RUN chown -R notes:notes /opt/note
USER notes:notes
WORKDIR /opt/note
RUN git clone https://github.com/nunes-raphael/spring-boot-mysql-rest-api-tutorial.git /opt/note
RUN mvn package -Dmaven.test.skip=true
ARG JAR_FILE=.jar
RUN cp ./target/easy-notes-1.0.0.jar /opt/note/easy-note.jar
COPY application.properties application.properties
ENTRYPOINT ["java", "-jar", "/easy-note.jar"]