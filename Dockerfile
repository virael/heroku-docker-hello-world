# Docker multi-stage build

# 1. Building the App with Maven
FROM maven:3-jdk-11

ADD . /herokudockerhelloworld
WORKDIR /herokudockerhelloworld

# Just echo so we can see, if everything is there :)
RUN ls -l

# Run Maven build
RUN mvn clean install


# 2. Just using the build artifact and then removing the build-container
FROM openjdk:11-jdk

VOLUME /tmp

# Add Spring Boot app.jar to Container
COPY --from=0 "/herokudockerhelloworld/target/heroku-docker-hello-world-0.0.1-SNAPSHOT.jar" app.jar

EXPOSE 8080

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java $JAVA_OPTS -Dserver.port=$PORT -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]


# https://blog.codecentric.de/en/2019/08/spring-boot-heroku-docker-jdk11/