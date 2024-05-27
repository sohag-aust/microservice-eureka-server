#Start with a base image containing Java runtime
FROM openjdk:17-jdk-slim

#Information around who maintains the image
MAINTAINER shohag

EXPOSE 8070

RUN apt-get update \
    && apt-get install -y jq

# Add the application's jar to the image
COPY target/eureka-0.0.1-SNAPSHOT.jar eureka-0.0.1-SNAPSHOT.jar

# execute the application
ENTRYPOINT ["java", "-jar", "eureka-0.0.1-SNAPSHOT.jar"]


HEALTHCHECK --start-period=60s --interval=10s --timeout=10s --retries=3 \
    CMD curl --silent --fail --request GET http://localhost:8070/actuator/health/readiness \
        | jq --exit-status '.status == "UP"' || exit 1