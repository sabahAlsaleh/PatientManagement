FROM openjdk:17-jdk-alpine
EXPOSE 8082
COPY target/PatientManagement-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]